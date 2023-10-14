let rec prompt_for_input prompt =
  print_string prompt;
  let input = read_line () in
  match int_of_string_opt input with
  | Some int_input when int_input < 1 ->
      print_endline "Error: Please provide a number greater than or equal to 1.";
      prompt_for_input prompt
  | Some int_input -> int_input
  | None ->
      if input = "" then
        print_endline "Error: Please provide a non-blank input."
      else print_endline "Error: Please provide a valid number.";
      prompt_for_input prompt

let range i = List.init i succ

let () =
  let numbers_to_add = prompt_for_input "How many numbers should we add?" in
  Printf.printf "We are going to add %i numbers." numbers_to_add;

  let numbers = range 5 in

  let number_inputs = List.map (fun _ -> 5 + 5;) [5; 5] in
