Mix.install([
  {:money, "~> 1.12"}
])

# Expected Inputs:
# Enter the price of item 1: 25
# Enter the quantity of item 1: 2
# Enter the price of item 2: 10
# Enter the quantity of item 2: 1
# Enter the price of item 3: 4
# Enter the quantity of item 3: 1

# Expected Output:
# Subtotal: $64.00
# Tax: $3.52
# Total: $67.52

defmodule Checkout do
  def run() do
    get_items()
    |> calculate_totals()
    |> print_totals()
  end

  defp get_items() do
    for item <- 1..3 do
      price = get_price(item)
      qty = get_qty(item)

      %{price: price, qty: qty}
    end
  end

  defp get_price(item) do
    input = request_input("Enter the price of item #{item}: ")

    case Float.parse(input) do
      {price, _remainder_of_string} ->
        round(price * 100) |> Money.new(:USD)

      :error ->
        puts_error_message(input)
        get_price(item)
    end
  end

  defp get_qty(item) do
    input = request_input("Enter the quantity of item #{item}: ")

    case Integer.parse(input) do
      {qty, ""} ->
        qty

      {_integer, _remainder} ->
        puts_error_message(input)
        get_qty(item)

      :error ->
        puts_error_message(input)
        get_qty(item)
    end
  end

  defp request_input(prompt) do
    IO.gets(prompt) |> String.trim()
  end

  defp puts_error_message(input) do
    "Invalid input: \"#{input}\". Please try again."
  end

  defp calculate_totals(items) do
    subtotal =
      Enum.reduce(items, Money.new(0, :USD), fn item, total_price ->
        item.price
        |> Money.multiply(item.qty)
        |> Money.add(total_price)
      end)

    tax_rate = 0.055
    tax = Money.multiply(subtotal, tax_rate)

    total = Money.add(subtotal, tax)

    %{subtotal: subtotal, tax: tax, total: total}
  end

  defp print_totals(totals) do
    IO.puts("Subtotal: #{Money.to_string(totals.subtotal)}")
    IO.puts("Tax: #{Money.to_string(totals.tax)}")
    IO.puts("Total: #{Money.to_string(totals.total)}")
  end
end

Checkout.run()
