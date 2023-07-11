type username = string

type password = string

exception UserNotFound

exception UserAlreadyExists

type users = (username * Client.user_info) list

type message = {
  date : string;
  time : string;
  user : username;
  content : string;
}

let init = []

let add_init_user user pass (users : users) =
  (user, Client.create_user user pass) :: users

let add_new_user user pass (users : users) =
  match List.assoc_opt user users with
  | None ->
      let csv_data = Csv.load "src/data.csv" @ [ [ user; pass ] ] in
      Csv.save "src/data.csv" csv_data;
      (user, Client.create_user user pass) :: users
  | Some _ -> raise UserAlreadyExists

let check_existing_user user pass (users : users) =
  match List.assoc_opt user users with
  | None -> raise UserNotFound
  | Some v -> if Client.get_password v = pass then true else false

let get_user_info user users =
  match List.assoc_opt user users with
  | None -> raise UserNotFound
  | Some v -> v

let taken_username username users =
  match List.assoc_opt username users with
  | Some _ -> true
  | None -> false

let remove_user user (users : users) =
  match List.assoc_opt user users with
  | None -> raise UserNotFound
  | Some _ -> List.remove_assoc user users

let username_list users = List.map fst users

let rec get_contact_list contact_list =
  match contact_list with
  | [] -> ""
  | h :: t -> h ^ " " ^ get_contact_list t

let get_contacts (users : users) contact =
  get_contact_list
    (List.filter (fun x -> fst x <> contact) users |> username_list)

(** Makes Csv into 2D array *)
let csv_array =
  let csv_data = Csv.load "src/data.csv" in
  Array.map Array.of_list (Array.of_list csv_data)

(** Makes 2D array into 2D list *)
let to_list arr = Array.to_list (Array.map Array.to_list arr)

let change_username_help username1 username2 =
  Array.iter
    (fun x -> if x.(0) = username1 then x.(0) <- username2)
    csv_array;
  csv_array

let change_pass_help username password =
  Array.iter
    (fun x -> if x.(0) = username then x.(1) <- password)
    csv_array;
  csv_array

let update_users_username
    (users : users)
    (username1 : username)
    (username2 : username) =
  Csv.save "src/data.csv"
    (to_list (change_username_help username1 username2));
  let old_user_info = get_user_info username1 users in
  (username2, old_user_info) :: List.remove_assoc username1 users

let update_users_password
    (users : users)
    (user : username)
    (new_password : password) =
  Csv.save "src/data.csv" (to_list (change_pass_help user new_password));
  let info = get_user_info user users in
  let new_info = Client.change_password info new_password in
  (user, new_info) :: List.remove_assoc user users

let rec num_users users =
  match users with
  | [] -> 0
  | _ :: t -> 1 + num_users t
