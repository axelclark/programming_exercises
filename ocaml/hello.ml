let () =
  print_string "What is your name? ";
  let name = read_line () in
  Printf.printf "Hello, %s, nice to meet you!\n" name
