(*ocamlfind ocamlopt -o retirement_calculator -package calendar -linkpkg retirement_calculator.ml*)
open CalendarLib

let current_year () =
  let now = Calendar.now () in
  Calendar.year now

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

let () =
  let prompts =
    [ "What is your current age?\n"; "What age would you like to retire?\n" ]
  in

  match List.map prompt_for_input prompts with
  | [ age; retirement_age ] ->
      if retirement_age > age then
        let year = current_year () in
        let years_left = retirement_age - age in
        let retirement_year = year + years_left in
        Printf.printf
          "You have %i years left until you retire.\n\
           It's %i, so you can retire in %i.\n"
          years_left year retirement_year
      else Printf.printf "You can already retire!\n"
  | _ -> failwith "Unexpected number of responses"
