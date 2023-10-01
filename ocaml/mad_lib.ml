let rec prompt_for_input prompt =
  print_string prompt;
  match read_line () with
  | "" ->
      print_endline "Error: Please provide a non-blank input.";
      prompt_for_input prompt
  | input -> input

let () =
  let prompts =
    [
      "Enter a noun\n";
      "Enter a verb\n";
      "Enter an adjective\n";
      "Enter an adverb\n";
    ]
  in

  let responses = List.map prompt_for_input prompts in

  match responses with
  | [ noun; verb; adjective; adverb ] ->
      Printf.printf "Do you %s your %s %s %s? That's hilarious!\n" verb
        adjective noun adverb
  | _ -> failwith "Unexpected number of responses"
