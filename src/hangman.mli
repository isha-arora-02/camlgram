(** Represents the functioning of Hangman

    This module has all the methods to run the game Hangman. *)

val won : bool ref
(** [won] whether the human won the game or not*)

val start_game : unit -> unit
(** [start_game ()] starts the game for the user *)

val array_word : string array ref
