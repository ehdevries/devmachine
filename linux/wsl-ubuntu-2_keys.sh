# before you run this script, make it executable: chmod +x wsl-ubuntu-2_keys.sh

# Step 2: generate an SSH key pair so that you can access your machine configuration repos

echo
echo "Generating RSA SSH keys"
echo
ssh-keygen -t rsa -b 4096

echo
echo "Generating ED25519 SSH keys"
echo
ssh-keygen -t ed25519

echo
echo "Here is your RSA SSH public key:"
cat ~/.ssh/id_rsa.pub

echo
echo "Here is your ED25519 SSH public key:"
cat ~/.ssh/id_ed25519.pub

echo
echo "Here are some handy links:"
echo "https://gitlab.com/-/profile/keys"
echo "https://github.com/settings/keys"
