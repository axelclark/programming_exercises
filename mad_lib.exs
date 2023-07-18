# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
# Do you walk your blue dog quickly? That's hilarious!

defmodule MadLib do
  def run do
    noun = get_input("Enter a noun: ")
    verb = get_input("Enter a verb: ")
    adjective = get_input("Enter an adjective: ")
    adverb = get_input("Enter an adverb: ")

    IO.puts("Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!")
  end

  defp get_input(prompt) do
    IO.gets(prompt) |> String.trim()
  end
end

MadLib.run()
