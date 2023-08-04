Mix.install([
  {:money, "~> 1.12"},
  {:decimal, "~> 2.0"}
])

defmodule CompoundInterest do
  def run do
    principle = get_principle()
    interest_rate = get_interest_rate()
    years = get_years()
    compounded_per_year = get_compounded_per_year()

    return = calculate_return(principle, interest_rate, years, compounded_per_year)

    response =
      "After #{years} years at #{interest_rate}%, the investment will be worth #{Money.to_string(return)} when compounded #{compounded_per_year} times per year."

    IO.puts(response)
  end

  defp get_principle() do
    input = get_input("What is the principle amount? ")

    case Money.parse(input, :USD) do
      {:ok, principle} ->
        principle

      :error ->
        puts_error_message(input)
        get_principle()
    end
  end

  defp get_interest_rate() do
    input = get_input("What is the interest rate? ")

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
    input = get_input("What is the number of years? ")

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

  def get_compounded_per_year() do
    input = get_input("What is the number of times the interest is compounded per year? ")

    case Decimal.parse(input) do
      {compounded_per_year, ""} ->
        compounded_per_year

      {_compounded_per_year, _unexpected_remainder} ->
        puts_error_message(input)
        get_compounded_per_year()

      :error ->
        puts_error_message(input)
        get_compounded_per_year()
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

  defp calculate_return(principle, interest_rate, years, compounded_per_year) do
    rate =
      interest_rate
      |> Decimal.div(100)
      |> Decimal.div(compounded_per_year)
      |> Decimal.add(1)

    periods = Decimal.mult(compounded_per_year, years) |> Decimal.to_integer()

    multiplier = pow(rate, periods)

    Money.multiply(principle, multiplier)
  end

  defp pow(%Decimal{} = base, exponent) when is_integer(exponent) do
    Enum.reduce(1..periods, 1, fn _, result ->
      Decimal.mult(rate, result)
    end)
  end
end

CompoundInterest.run()
