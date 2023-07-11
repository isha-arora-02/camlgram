(** Represents the functioning of Word Scramble This module has all the
    methods to run the game Word Scramble. *)

val score : (int * string) ref
(** [score] the score received by the player*)

val start_game : unit -> unit
(** [start_game ()] starts the game for the user *)