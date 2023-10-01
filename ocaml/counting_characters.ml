let rec prompt_for_input () =
  print_string "What is the input string? ";
  match read_line () with
  | "" ->
      print_endline "Error: Please provide a non-blank input.";
      prompt_for_input ()
  | input ->
      let count = String.length input in

      Printf.sprintf "%s has %i characters.\n" input count

let () =
  let message = prompt_for_input () in
  print_endline message
