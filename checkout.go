package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

type Item struct {
    Price  float64
    Quantity int
}

func main() {
    items := getItems()
    calculateAndPrintTotals(items)
}

func getItems() []Item {
    reader := bufio.NewReader(os.Stdin)
    items := make([]Item, 3)

    for i := range items {
        items[i].Price = getPrice(reader, i+1)
        items[i].Quantity = getQuantity(reader, i+1)
    }

    return items
}

func getPrice(reader *bufio.Reader, itemNum int) float64 {
    for {
        fmt.Printf("Enter the price of item %d: ", itemNum)
        priceStr, _ := reader.ReadString('\n')
        priceStr = strings.TrimSpace(priceStr)
        price, err := strconv.ParseFloat(priceStr, 64)

        if err == nil {
            return price
        }

        fmt.Println("Invalid input. Please try again.")
    }
}

func getQuantity(reader *bufio.Reader, itemNum int) int {
    for {
        fmt.Printf("Enter the quantity of item %d: ", itemNum)
        quantityStr, _ := reader.ReadString('\n')
        quantityStr = strings.TrimSpace(quantityStr)
        quantity, err := strconv.Atoi(quantityStr)

        if err == nil {
            return quantity
        }

        fmt.Println("Invalid input. Please try again.")
    }
}

func calculateAndPrintTotals(items []Item) {
    var subtotal float64
    for _, item := range items {
        subtotal += item.Price * float64(item.Quantity)
    }

    taxRate := 0.055
    tax := subtotal * taxRate
    total := subtotal + tax

    fmt.Printf("Subtotal: $%.2f\n", subtotal)
    fmt.Printf("Tax: $%.2f\n", tax)
    fmt.Printf("Total: $%.2f\n", total)
}
