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

let ft_to_meter_conversion = 0.09290304

let () =
  let prompts =
    [
      "What is the length of the room in feet?\n";
      "What is the width of the room in feet?\n";
    ]
  in

  match List.map prompt_for_input prompts with
  | [ length; width ] ->
      let sq_ft = length * width in
      let sq_meters = float_of_int sq_ft *. ft_to_meter_conversion in
      Printf.printf
        "You entered dimension of %i ft by %i ft.\n\
         The area is \n\
         %i sq ft.\n\
         %f sq meters" length width sq_ft sq_meters
  | _ -> failwith "Unexpected number of responses"
