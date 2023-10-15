let rec prompt_for_input prompt =
  print_string prompt;
  match read_line () with
  | "" ->
      print_endline "Error: Please provide a non-blank input.";
      prompt_for_input prompt
  | input -> input

let employees =
  [
    "John Smith";
    "Jackie Jackson";
    "Chris Jones";
    "Amanda Cullen";
    "Jeremy Goodwin";
  ]

let () =
  print_endline "There are 5 employees:";
  List.iter print_endline employees;
  let name_to_remove = prompt_for_input "Enter an employee name to remove: " in

  if List.mem name_to_remove employees then
    let updated_employees =
      List.filter (fun name -> name_to_remove <> name) employees
    in

    List.iter print_endline updated_employees
  else print_endline "That name doesn't exist"
