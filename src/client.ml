type username = string

type password = string

type user_info = {
  mutable username : username;
  mutable password : password;
  mutable contacts : username list;
}

let history = ref []
(* let history_map = Hashtbl.create 10 *)

let create_user user pass =
  { username = user; password = pass; contacts = [] }

let get_username user = user.username

let get_password user = user.password

let get_contacts user = user.contacts

let add_contacts user new_contact =
  let _ = user.contacts <- new_contact.username :: user.contacts in
  new_contact.contacts <- user.username :: new_contact.contacts

let change_username user new_username =
  user.username <- new_username;
  user

let change_password user new_password =
  user.password <- new_password;
  user

