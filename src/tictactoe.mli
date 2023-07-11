(** Represents the functioning of Tic Tac Toe

This module has all the methods to run the game Tic Tac Toe. *)

val won : bool ref
(** [won] whether the human won the game or not*)

val start_game : unit -> unit
(** [start_game ()] starts the game for the user *)