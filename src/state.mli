(** Representation of the state of the system.

    This module represents the data for all the users and chats
    registered in the system including usernames, passwords, and chat
    history. *)

exception UserNotFound

exception UserAlreadyExists

type username = string
(** [username] is the username for the user *)

type password = string
(** [password] is the password for the user *)

type users
(** [users] is the list of users and their information *)

type message
(** [message] is the record containing a message and the date, time it
    was sent and the user that sent it *)

val init : users
(** [init] initializes an empty list of [users] *)

val add_init_user : username -> password -> users -> users
(** [add_init_user] adds a new user with a [user] and [pass] to the list
    of [users] registered in the system *)

val add_new_user : username -> password -> users -> users
(** [add_new_user] updates the csv file with the new user's user and
    pass if not already in csv. If the user already exists in the csv,
    raise [UserAlreadyExists]*)

val check_existing_user : username -> password -> users -> bool
(** [check_existing_user] checks whether a user exists in [users] with
    the given [user] and [pass] *)

val get_user_info : username -> users -> Client.user_info
(** [get_user_info] is the information associated with the profile of a
    user with [user] and [pass] in the list of registered [users] *)

val taken_username : username -> users -> bool
(** [taken_username] checks if the [user] entered already exists in the
    list of [users] *)

val remove_user : username -> users -> users
(** [remove_user] removes a user from the list of [users] registered in
    the system *)

val get_contacts : users -> username -> string
(** [get_contacts] returns a list of usernames other than the current
    [user] *)

val update_users_username : users -> username -> username -> users
(** [update_users_username users username1 username2] returns the
    updated list of [users] with [username1] in place of [username2] *)

val update_users_password : users -> username -> password -> users
(** [update_users_password users user password] returns the updated list
    of [users] with the new [password] for [user] *)

val num_users : users -> int
(** [num users] returns the number of users in [users]*)
