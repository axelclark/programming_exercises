defmodule RetirementCalculator do
  def run do
    current_age = get_input("What is your current age? ")
    retirement_age = get_input("At what age would you like to retire? ")

    years_left = retirement_age - current_age
    year = Date.utc_today().year
    retirement_year = year + years_left

    response = """
    You have #{years_left} years left until you can retire.
    It's #{year}, so you can retire in #{retirement_year}.
    """

    IO.puts(response)
  end

  defp get_input(prompt) do
    prompt
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()
  end
end

RetirementCalculator.run()
