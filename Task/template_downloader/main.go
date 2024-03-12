package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/user"
	"strings"
)

func main() {
	//key:value pair (name:url)
	urls := map[string]string{
		"General":      "https://raw.githubusercontent.com/kenf1/dotfiles/main/QuartoTemplates/General.qmd",
		"Presentation": "https://raw.githubusercontent.com/kenf1/dotfiles/main/QuartoTemplates/Presentation.qmd",
	}

	//prompt user (includes available choices)
	prompt_user(urls)
}

// create save dir (path + filename)
func create_dir(concat_path string) string {
	//create file path + name (saves to desktop)
	cuser, err := user.Current()
	if err != nil {
		log.Fatal(err)
	}

	saveDir := cuser.HomeDir + "/" + concat_path
	return saveDir
}

// download file from url
func download_file(url string, saveDir string) {
	//create file
	file, err := os.Create(saveDir)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	//get file contents
	resp, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	//save to file
	_, err = io.Copy(file, resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("File downloaded to", saveDir)
}

// download all defined in map
func download_all(urls map[string]string) {
	for key, value := range urls {
		tempName := "Desktop/" + key + ".qmd"
		saveDir := create_dir(tempName)
		download_file(value, saveDir)
	}
}

// prompt user + download chosen template
func prompt_user(urls map[string]string) {
	var userChoice string

	//show all available options
	fmt.Print("Enter name of template to download: \n")
	for key := range urls {
		fmt.Print(" ", key, "\n")
	}
	fmt.Print(" All\n")

	//match user input
	fmt.Scan(&userChoice)
	if strings.ToLower(userChoice) == "general" {
		savedir := create_dir("Desktop/General.qmd")
		download_file(urls["General"], savedir)
	} else if strings.ToLower(userChoice) == "Presentation" {
		savedir := create_dir("Desktop/Presentation.qmd")
		download_file(urls["Presentation"], savedir)
	} else if strings.ToLower(userChoice) == "all" {
		download_all(urls)
	} else {
		fmt.Print("Invalid input. Please check accepted values and try again.")
	}
}
