### Before you run this script, make it executable: chmod +x 5_configure-part-two-wsl.sh

winHomeDefault="/mnt/c/Users/$(whoami)/"

echo "Enter the path to your Windows home directory"
echo "[press Enter to accept default: $winHomeDefault]"
read winHomeInput

if [ -z "$winHomeInput" ]
then
  winHomePath=$winHomeDefault
else
  winHomePath=$winHomeInput
fi

while [ ! -d "$winHomePath" ]
do
  echo "Whoops, that is not a valid directory"
  echo "Pro tip: your Windows C: drive is mounted at /mnt/c/"
  echo "Enter the path to your Windows home directory"
  read winHomePath
done

ln -s "$winHomePath" ~/winHome
echo "'winHome' in your WSL home directory now links to your Windows home directory"

echo
echo "Adding WSL-specific Git configuration"
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
