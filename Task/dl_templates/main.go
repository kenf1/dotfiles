package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/user"
)

func main() {
	url := "https://raw.githubusercontent.com/kenf1/dotfiles/main/QuartoTemplates/General.qmd"

	//create file path + name (saves to desktop)
	cuser, err := user.Current()
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	homeDir := cuser.HomeDir
	saveDir := homeDir + "/Desktop/General.qmd"

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
