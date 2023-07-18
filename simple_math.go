package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func getInput(prompt string, reader *bufio.Reader) int {
	fmt.Print(prompt)
	input, _ := reader.ReadString('\n')
	number, _ := strconv.Atoi(strings.TrimSpace(input))
	return number
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	firstNum := getInput("What is the 1st number?\n", reader)
	secondNum := getInput("What is the 2nd number?\n", reader)

	fmt.Printf("%d + %d = %d\n", firstNum, secondNum, firstNum+secondNum)
	fmt.Printf("%d - %d = %d\n", firstNum, secondNum, firstNum-secondNum)
	fmt.Printf("%d * %d = %d\n", firstNum, secondNum, firstNum*secondNum)
	fmt.Printf("%d / %d = %d\n", firstNum, secondNum, firstNum/secondNum)
}
