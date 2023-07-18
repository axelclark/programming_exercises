package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("What is your input string? ")
	input, _ := reader.ReadString('\n')

	input = strings.TrimSpace(input)

	numChars := len(input)

	response := fmt.Sprintf("%s has %d characters.", input, numChars)

	fmt.Println(response)
}
