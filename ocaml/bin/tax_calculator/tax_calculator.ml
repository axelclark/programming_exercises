let rec prompt_for_float_input prompt =
  print_string prompt;
  let input = read_line () in
  match float_of_string_opt input with
  | Some float_input when float_input < 1.0 ->
      print_endline "Error: Please provide a number greater than or equal to 1.";
      prompt_for_float_input prompt
  | Some float_input -> float_input
  | None ->
      if input = "" then
        print_endline "Error: Please provide a non-blank input."
      else print_endline "Error: Please provide a valid number.";
      prompt_for_float_input prompt

let rec prompt_for_state prompt =
  print_string prompt;
  let input = read_line () in
  match input with
  | "WI" -> input
  | "MN" -> input
  | _ ->
      print_endline "Error: Please provide either WI or MN.";
      prompt_for_state prompt

let () =
  let float_prompt = "What is the order amount?\n" in
  let order_amount = prompt_for_float_input float_prompt in

  let state_prompt = "What is the state?\n" in
  let state = prompt_for_state state_prompt in

  if state = "MN" then
    let message = Printf.sprintf "The total is $%f." order_amount in

    print_endline message
  else
    let tax_rate = 0.055 in
    let tax = order_amount *. tax_rate in
    Printf.printf "The subtotal is $%f.\nThe tax is $%f.\nThe total is $%f."
      order_amount tax (order_amount +. tax)
