read -p "enter github username:" username
read -p "enter email:" useremail  
git config --global user.name "$username"
git config --global user.email "$useremail"
git config --global user.name
git config --global user.email
echo "do you want to configure ssh key(y/Y or n/N):"
read sshResponse
case ${sshResponse} in 
  y|Y|yes|YES) 
  echo "generating new keypairs"
  ssh-keygen -t ed25519 -C "$useremail"
  eval "$(ssh-agent -s)"
  echo "Host github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
  ssh-add ~/.ssh/id_ed25519
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "id_ed25519.pub copied to clipboard"
esac

