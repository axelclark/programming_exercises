let () =
  print_string "What is your name? ";

  let name = read_line () in
  let message = Printf.sprintf "Hello, %s, nice to meet you!\n" name in

  print_endline message
