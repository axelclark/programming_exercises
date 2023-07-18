package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"
)

func getInput(prompt string, reader *bufio.Reader) int {
	fmt.Print(prompt)
	input, _ := reader.ReadString('\n')
	number, _ := strconv.Atoi(strings.TrimSpace(input))
	return number
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	currentAge := getInput("What is your current age? ", reader)
	retirementAge := getInput("At what age would you like to retire? ", reader)

	yearsLeft := retirementAge - currentAge
	year := time.Now().Year()
	retirementYear := year + yearsLeft

	fmt.Printf("You have %d years left until you can retire.\n", yearsLeft)
	fmt.Printf("It's %d, so you can retire in %d.\n", year, retirementYear)
}
