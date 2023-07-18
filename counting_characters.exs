defmodule CountingCharacters do
  def run do
    input = IO.gets("What is your input string? ") |> String.trim()

    num_chars = String.length(input)

    response = "#{input} has #{num_chars} characters."

    IO.puts(response)
  end
end

CountingCharacters.run()
