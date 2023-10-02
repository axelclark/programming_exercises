let rec prompt_for_input prompt =
  print_string prompt;
  match read_line () with
  | "" ->
      print_endline "Error: Please provide a non-blank input.";
      prompt_for_input prompt
  | input -> input

let () =
  let prompts =
    [ "What is the first number?\n"; "What is the second number?\n" ]
  in

  match List.map prompt_for_input prompts with
  | [ first; second ] ->
      let first_num = float_of_string first in
      let second_num = float_of_string second in

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
