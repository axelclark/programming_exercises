let rec prompt_for_integer_input prompt =
  print_string prompt;
  let input = read_line () in
  match int_of_string_opt input with
  | Some int_input when int_input < 1 ->
      print_endline "Error: Please provide a number greater than or equal to 1.";
      prompt_for_integer_input prompt
  | Some int_input -> int_input
  | None ->
      if input = "" then
        print_endline "Error: Please provide a non-blank input."
      else print_endline "Error: Please provide a valid number.";
      prompt_for_integer_input prompt

let call_prompt_n_times n =
  let times = List.init n (fun _ -> "Enter a number:") in
  List.map prompt_for_integer_input times

let sum_numbers_in_list numbers = List.fold_left ( + ) 0 numbers

let () =
  let numbers_to_add =
    prompt_for_integer_input "How many numbers should we add?"
  in
  Printf.printf "We are going to add %i numbers.\n" numbers_to_add;
  let numbers = call_prompt_n_times numbers_to_add in
  let sum = sum_numbers_in_list numbers in
  Printf.printf "The total is %i.\n" sum
