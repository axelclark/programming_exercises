defmodule PrintingQuotes do
  def run do
    quote_input = IO.gets("What is the quote? ") |> String.trim()
    author = IO.gets("Who said it? ") |> String.trim()

    response = "#{author} says, \"#{quote_input}\""

    IO.puts(response)
  end
end

PrintingQuotes.run()
