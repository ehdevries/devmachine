# before you run this script, make it executable: chmod +x wsl-ubuntu-2_keys.sh

# Step 2: generate an SSH key pair so that you can access your machine configuration repos

ssh-keygen -t ed25519
echo
echo "Here is your shiny new SSH public key:"
cat ~/.ssh/id_ed25519.pub
echo
echo "Now, copy that entire line and register it with your favorite code hosting services"
echo
echo "Some handy links:"
echo "https://gitlab.com/help/ssh/README"
echo "https://gitlab.com/profile/keys"
echo "https://help.github.com/articles/connecting-to-github-with-ssh/"
echo "https://github.com/settings/keys"
