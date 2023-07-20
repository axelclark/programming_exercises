Mix.install([
  {:money, "~> 1.12"},
  {:decimal, "~> 2.0"}
])

defmodule CurrencyConversion do
  def run do
    prompt = "How many euros are you exchanging? "
    euros_input = get_input(prompt)

    euros =
      case Money.parse(euros_input, :EUR) do
        {:ok, euros} ->
          euros

        :error ->
          puts_error_message(euros_input)
          get_input(prompt)
      end

    rate = get_input("What is the exchange rate? ")

    dollars = convert_currency(euros, rate)

    response =
      "#{Money.to_string(euros)} at an exhange rate of #{rate} is #{Money.to_string(dollars)} U.S. dollars."

    IO.puts(response)
  end

  defp get_input(prompt) do
    prompt
    |> IO.gets()
    |> String.trim()
  end

  defp puts_error_message(input) do
    IO.puts("Invalid input: \"#{input}\". Please try again.")
  end

  defp convert_currency(amount, rate) do
    decimal_rate = Decimal.div(rate, 100)

    amount
    |> Money.multiply(decimal_rate)
    |> Money.to_decimal()
    |> Money.parse!(:USD)
  end
end

CurrencyConversion.run()
