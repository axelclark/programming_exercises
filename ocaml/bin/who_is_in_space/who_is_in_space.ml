open Cohttp_lwt_unix
open Yojson.Basic.Util

type person = { name : string; craft : string }

let extract_person person_json =
  {
    name = person_json |> member "name" |> to_string;
    craft = person_json |> member "craft" |> to_string;
  }

let get_body uri =
  let resp, body = Client.call `GET (Uri.of_string uri) |> Lwt_main.run in
  match resp.status with
  | `OK -> Cohttp_lwt.Body.to_string body |> Lwt_main.run
  | _ -> failwith "Error on server response"

let parse_json body = Yojson.Basic.from_string body

let process_json json =
  let people = json |> member "people" |> to_list in
  List.map extract_person people

let () =
  let uri = "http://api.open-notify.org/astros.json" in
  let body = get_body uri in
  let json = parse_json body in
  let people = process_json json in
  List.iter
    (fun person ->
      Printf.printf "Name: %s, Craft: %s\n" person.name person.craft)
    people
