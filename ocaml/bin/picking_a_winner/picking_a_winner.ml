let rec prompt_for_input prompt acc =
  print_string prompt;
  match read_line () with
  | "" -> acc
  | input -> prompt_for_input prompt (input :: acc)

let pick_winner names =
  let number_of_names = List.length names in
  let name_index = Random.int number_of_names in
  let name = List.nth names name_index in
  Printf.printf "The winner is... %s\n" name

let () =
  Random.self_init ();
  let names = prompt_for_input "Enter a name: \n" [] in
  match names with
  | [] -> print_endline "No names entered"
  | names -> pick_winner names
