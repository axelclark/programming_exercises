defmodule RectangleArea do
  @meter_conversion 0.09290304

  def run do
    length = get_input("What is the length of the room in feet? ")
    width = get_input("What is the width of the room in feet? ")

    sq_ft_area = length * width
    sq_meter_area = (sq_ft_area * @meter_conversion) |> Float.round(3)

    response =
      """
      You entered dimensions of #{length} ft by #{width} ft.
      The area is 
      #{sq_ft_area} sq ft
      #{sq_meter_area} meters
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

RectangleArea.run()
