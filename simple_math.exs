defmodule SimpleMath do
  def run do
    first_num = get_input("What is the 1st number?\n")
    second_num = get_input("What is the 2nd number?\n")

    response = """
    #{first_num} + #{second_num} = #{first_num + second_num}
    #{first_num} - #{second_num} = #{first_num - second_num}
    #{first_num} * #{second_num} = #{first_num * second_num}
    #{first_num} / #{second_num} = #{first_num / second_num}
    """

    IO.puts(response)
  end

  def get_input(prompt) do
    IO.gets(prompt) |> String.trim() |> String.to_integer()
  end
end

SimpleMath.run()
