package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func getInput(prompt string, reader *bufio.Reader) string {
	fmt.Print(prompt)
	input, _ := reader.ReadString('\n')
	return strings.TrimSpace(input)
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	noun := getInput("Enter a noun: ", reader)
	verb := getInput("Enter a verb: ", reader)
	adjective := getInput("Enter an adjective: ", reader)
	adverb := getInput("Enter an adverb: ", reader)

	fmt.Printf("Do you %s your %s %s %s? That's hilarious!\n", verb, adjective, noun, adverb)
}
