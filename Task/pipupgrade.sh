#!/bin/zsh

#uses pipupgrade python package to update python packages

#update pipupgrade package
python3 -m pipupgrade --self

#check for package updates
python3 -m pipupgrade --check

#prompt user with type of update to install
read -p "Enter the type of update to install: pip OR major OR default (minor + patch) " update_type

#update
if [ ${update_type} == "pip" ]
    then
        python3 -m pip install --upgrade pip
elif [ ${update_type} == "major" ]
    then
        python3 -m pipupgrade --upgrade-type major
elif [ ${update_type} == "default" ]
    then
        python3 -m pipupgrade --upgrade-type {minor,patch}
else
    echo "The accepted options are: pip, major or default. Please try again."
fi

#completion text
echo "Complete."