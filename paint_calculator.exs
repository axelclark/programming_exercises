defmodule PaintCalculator do
  @gallons_per_sq_ft 350

  def run do
    length = get_input("What is the length of the room in feet? ")
    width = get_input("What is the width of the room in feet? ")

    sq_ft_area = length * width
    gallons = (sq_ft_area / @gallons_per_sq_ft) |> ceil()

    response =
      """
      You entered dimensions of #{length} ft by #{width} ft.
      You will need to purchase #{gallons} gallons of paint to 
      cover #{sq_ft_area} sq ft.
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

PaintCalculator.run()
