Mix.install([
  :req
])

response = Req.get!("http://api.open-notify.org/astros.json").body

IO.puts("There are #{response["number"]} people in space right now.")

Enum.each(response["people"], fn astronaut ->
  IO.puts("Name: #{astronaut["name"]} - Craft: #{astronaut["craft"]}")
end)
