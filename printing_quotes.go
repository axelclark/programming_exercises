package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("What is the quote? ")
	quoteInput, _ := reader.ReadString('\n')
	quoteInput = strings.TrimSpace(quoteInput)

	fmt.Print("Who said it? ")
	author, _ := reader.ReadString('\n')
	author = strings.TrimSpace(author)

	response := fmt.Sprintf("%s says, \"%s\"", author, quoteInput)

	fmt.Println(response)
}
