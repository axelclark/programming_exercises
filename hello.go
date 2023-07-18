package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("What is your name? ")
	name, _ := reader.ReadString('\n')

	name = strings.TrimSpace(name)

	response := fmt.Sprintf("Hello %s, nice to meet you!", name)

	fmt.Println(response)
}
