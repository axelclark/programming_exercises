Mix.install([
  {:money, "~> 1.12"},
  {:decimal, "~> 2.0"}
])

defmodule SimpleInterest do
  def run do
    principle = get_principle()
    interest_rate = get_interest_rate()
    years = get_years()

    return = calculate_return(principle, interest_rate, years)

    response =
      "After #{years} years at #{interest_rate}%, the investment will be worth #{Money.to_string(return)}."

    IO.puts(response)
  end

  defp get_principle() do
    input = get_input("Enter the principle ")

    case Money.parse(input, :USD) do
      {:ok, principle} ->
        principle

      :error ->
        puts_error_message(input)
        get_principle()
    end
  end

  defp get_interest_rate() do
    input = get_input("Enter the interest rate ")

    case Decimal.parse(input) do
      {interest_rate, ""} ->
        interest_rate

      {_interest_rate, _unexpected_remainder} ->
        puts_error_message(input)
        get_interest_rate()

      :error ->
        puts_error_message(input)
        get_interest_rate()
    end
  end

  defp get_years() do
    input = get_input("Enter the number of years ")

    case Decimal.parse(input) do
      {years, ""} ->
        years

      {_years, _unexpected_remainder} ->
        puts_error_message(input)
        get_years()

      :error ->
        puts_error_message(input)
        get_years()
    end
  end

  defp get_input(prompt) do
    prompt
    |> IO.gets()
    |> String.trim()
  end

  defp puts_error_message(input) do
    IO.puts("Invalid input: \"#{input}\". Please try again.")
  end

  defp calculate_return(principle, interest_rate, years) do
    multiplier =
      interest_rate
      |> Decimal.div(100)
      |> Decimal.mult(years)
      |> Decimal.add(1)

    Money.multiply(principle, multiplier)
  end
end

SimpleInterest.run()
