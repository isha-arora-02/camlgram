(** Representation of the data for a particular client or user.

    This module represents all the data associated with a particular
    user incuding their username, password, profile details, and chats. *)

type username = string
(** [username] is the username for the user *)

type password = string
(** [password] is the password for the user *)

type user_info
(** [user_info] is the abstract type of values representing the values
    associated with a particular user*)

val history : string list ref
(** [history] is the mutable string list of message history for the user *)

val create_user : username -> password -> user_info
(** [create_user user pass] creates a new user with a given [user] and
    [pass] *)

val get_username : user_info -> username
(** [get_username user] is the username of the person *)

val get_password : user_info -> password
(** [get_username user] is the password of the person with the
    registered [user] *)

val add_contacts : user_info -> user_info -> unit
(** [add_contacts user new_contact] adds a new user into the list of
    contacts for an existing user *)

val get_contacts : user_info -> username list
(** [get_contacts user] is the list of contacts for the given user *)

val change_username : user_info -> string -> user_info
(** [change_username user new_username] updates the user with a new
    username *)

val change_password : user_info -> string -> user_info
(** [change_password user new_password] updates the user with a new
    password *)
