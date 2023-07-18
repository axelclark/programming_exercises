defmodule Hello do
  def run do
    name = IO.gets("What is your name? ") |> String.trim()

    response = "Hello #{name}, nice to meet you!"

    IO.puts(response)
  end
end

Hello.run()
