#!/bin/zsh

#downloads specified Quarto template

#vars
export general_template="https://raw.githubusercontent.com/kenf1/dotfiles/main/QuartoTemplates/General.qmd"
export presentation_template="https://raw.githubusercontent.com/kenf1/dotfiles/main/QuartoTemplates/Presentation.qmd"

#prompt user: template to download
echo "Enter the name of template to download: \n General \n Presentation"
read template_name

#prompt user: download folder
echo "Enter FULL path of folder to save template in: "
read path_folder

#prompt user: file name
echo "Enter new name for downloaded template: (exclude extension)"
read new_name

#create full path
export full_path="${path_folder}/${new_name}.qmd"

#download file
if [ ${template_name} == "General" ];
    then
        curl -o $full_path $general_template
        echo "Download started."
elif [ ${template_name} == "Presentation" ];
    then
        curl -o $full_path $presentation_template
        echo "Download started."
else
    echo "Please try again with one of the listed template names."
fi