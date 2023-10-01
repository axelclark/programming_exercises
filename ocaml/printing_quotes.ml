let rec prompt_for_input prompt =
  print_string prompt;
  match read_line () with
  | "" ->
      print_endline "Error: Please provide a non-blank input.";
      prompt_for_input prompt
  | input -> input

let () =
  let quote_prompt = "What is the quote?\n" in
  let quote = prompt_for_input quote_prompt in

  let author_prompt = "Who said it?\n" in
  let author = prompt_for_input author_prompt in

  let message = author ^ " says, " ^ "\"" ^ quote ^ "\"" in
  print_endline message
