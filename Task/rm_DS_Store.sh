#!/bin/zsh

#intro
echo "Remove .DS_Store from git repo."
echo "Script by KF: https://github.com/kenf1"
echo ""

#prompt user
echo "Enter 1 to remove .DS_Store from current directory or 2 to remove it from entire git repo:"
read option

#rm .DS_Store & stage changes
if [[ $option == "1" ]]; then
  git rm --cached .DS_Store
  git add .
elif [[ $option == "2" ]]; then
  find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch -f
  git add .
else
  echo "The options are 1 or 2. Please try again."
fi

echo "Would you like to commit the changes? (Y/N)"
read decision

if [[ $decision == "Y" ]]; then
    read -p "Enter commit message: " message
    git commit -m "$message"
    git push origin main
else
  echo "Changes staged. Commit cancelled. Please commit and push manually."
fi