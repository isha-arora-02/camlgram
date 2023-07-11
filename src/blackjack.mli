(** Represents the functioning of BlackJack

This module has all the methods to run the game blackjack. *)

type suit = 
| Clubs
| Spades
| Diamonds
| Hearts

type card_typ =
| Number of int
| King
| Queen
| Jack
| Ace

val start_game : unit -> unit
(** [start_game ()] starts the game for the user *)

val total_sum : (suit * card_typ) option list -> int -> int
(** [total_sum hand acc]  is the score of the cards in the 
player's [hand]*)  

val str_of_card : (suit * card_typ) option -> string
(** [str_of_card card] is the string representation of a card *)