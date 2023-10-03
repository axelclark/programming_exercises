let rec prompt_for_input prompt =
  print_string prompt;
  let input = read_line () in
  match float_of_string_opt input with
  | Some float_input when float_input < 1.0 ->
      print_endline "Error: Please provide a number greater than or equal to 1.";
      prompt_for_input prompt
  | Some float_input -> float_input
  | None ->
      if input = "" then
        print_endline "Error: Please provide a non-blank input."
      else print_endline "Error: Please provide a valid number.";
      prompt_for_input prompt

let () =
  let prompts =
    [ "What is the first number?\n"; "What is the second number?\n" ]
  in

  match List.map prompt_for_input prompts with
  | [ first_num; second_num ] ->
      let sum = first_num +. second_num in
      let difference = first_num -. second_num in
      let product = first_num *. second_num in
      let quotient = first_num /. second_num in

      Printf.printf
        {|
      %g + %g = %g
      %g - %g = %g
      %g * %g = %g
      %g / %g = %g
      
      |}
        first_num second_num sum first_num second_num difference first_num
        second_num product first_num second_num quotient
  | _ -> failwith "Unexpected number of responses"
