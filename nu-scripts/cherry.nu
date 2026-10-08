# Cherry-pick a selected commit from main to a selected release branch using a TUI
export def 'kp cherry-pick' [] {
  let in_git_repo = (do { git rev-parse --abbrev-ref HEAD } | complete | get stdout | is-not-empty)

  if (not $in_git_repo) {
    print 'Current directory is not a Git repository'
    return
  }

  print 'Fetching the latest changes ...'
  git fetch

  tui split --vertical --sizes [2fr 1fr] [
    (
      recent-commits
      | tui box 'origin/main' [
        (tui search --title 'Search commits' --placeholder '/ to focus' --bind /)
        (tui select --id commits --title 'Choose a commit to cherry-pick' --display subject)
      ]
    )
    (
      release-branches
      | tui select --id branches --title 'Choose a release branch to target'
    )
  ]
  | tui run
  | cherry-pick-commit-to-release-branch $in.values.commits.row.hash $in.values.branches.row
}

def recent-commits [] {
  git log --since='5 weeks ago' --format='%h|||%s [%ar] <%an>' origin/main
  | lines
  | split column '|||' hash subject
}

def release-branches [] {
  let this_year = date now | format date '%Y'
  let last_year = (date now) - 365day | format date '%Y'

  git branch --remotes
  | lines
  | where {|branch| $branch =~ 'release\/\d\d\d\d\.\d\d'}
  | where {|branch| $branch has $this_year or $branch has $last_year }
  | each {|branch| $branch | str replace 'origin/' '' | str trim }
  | sort --reverse
}

def cherry-pick-commit-to-release-branch [commit_hash: string, release_branch: string] {
  let new_branch_name = build-new-branch-name $commit_hash $release_branch
  let new_commit_message = build-new-commit-message $commit_hash

  print ''
  git switch --no-track --create $new_branch_name $'origin/($release_branch)'

  print ''
  print 'Cherry-picking to new branch'
  print ''
  git cherry-pick --no-commit $commit_hash

  print 'Committing changes with updated message'
  print ''
  git commit --message=($new_commit_message)

  print ''
  print 'Next steps:'
  print '- Review the diff'
  print '- If needed, resolve any merge conflicts and commit'
  print '- Push the new branch'
  print '- Review and submit the PR, targeting the release branch, including links to the original PR and work item'
  print ''
}

def build-new-branch-name [commit_hash: string, release_branch: string] {
  ['cherrypick/from' $commit_hash 'to' ($release_branch | str replace '/' '-')] | str join '-'
}

def build-new-commit-message [commit_ref: string] {
  let commit_subject = commit-subject $commit_ref
  let commit_body = commit-body $commit_ref

  [
    $"\(cherry-pick\) (simplified-commit-subject $commit_subject)"
    $"Cherry-picked from (gh-pr-link $commit_subject)"
    (ab-card-link $commit_body)
  ]
  | str join "\n\n"
}

def commit-subject [commit_ref: string] {
  git show --format='%s' --no-patch $commit_ref
}

def commit-body [commit_ref: string] {
  git show --format='%b' --no-patch $commit_ref
}

def simplified-commit-subject [commit_subject: string] {
  $commit_subject
  | str replace --regex '\(#\d+\)' ''
  | str trim
}

def gh-pr-link [commit_subject: string] {
  $commit_subject
  | parse --regex '\((?P<pr>#\d+)\)'
  | get pr
  | first
}

def ab-card-link [commit_body: string] {
  $commit_body
  | parse --regex '\[(?P<card>AB#\d+)\]'
  | get card
  | first
}
