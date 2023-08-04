defmodule Pizza do
  def run do
    people = get_input("How many people? ")
    pizzas = get_input("How many pizzas do you have? ")
    slices = get_input("How many slices of per pizza? ")

    total_slices = pizzas * slices

    pieces = Integer.floor_div(total_slices, people)
    remainder = Integer.mod(total_slices, people)

    response =
      """
      #{people} people with #{pizzas} pizzas and #{total_slices} slices.
      Each person gets #{pieces} pieces of pizza.
      There are #{remainder} slices left over.
      """

    IO.puts(response)
  end

  defp get_input(prompt) do
    input =
      prompt
      |> IO.gets()
      |> String.trim()

    case Integer.parse(input) do
      {length, _} ->
        length

      :error ->
        puts_error_message(input)
        get_input(prompt)
    end
  end

  defp puts_error_message(input) do
    IO.puts("Invalid input: \"#{input}\". Please try again.")
  end
end

Pizza.run()
