let rec prompt_for_input prompt =
  print_string prompt;
  match read_line () with
  | "" ->
      print_endline "Error: Please provide a non-blank input.";
      prompt_for_input prompt
  | input -> input

let () =
  Random.self_init ();
  let _question = prompt_for_input "What is your question?\n" in
  let answers =
    [| "Yes"; "No"; "Maybe"; "Ask again later"; "Outlook not so good" |]
  in
  let number_of_answers = Array.length answers in
  let answer_index = Random.int number_of_answers in
  let answer = Array.get answers answer_index in
  print_endline answer
