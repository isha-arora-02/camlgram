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

(** [( -- ) n1 n2 acc] creates a new list including successive integers
    from n1 to n2 *)
let rec ( -- ) n1 n2 acc =
  if n1 = n2 then List.rev (n2 :: acc)
  else
    let new_lst = n1 :: acc in
    ( -- ) (n1 + 1) n2 new_lst

(** [init_deck ()] is a new deck of 52 cards consisting of the four
    [suit]s and the various [card_typ]s *)
and init_deck () =
  let make_set_one suit_type () =
    let num_lst = ( -- ) 2 10 [] in
    let card_num_lst =
      List.map (fun x -> Some (suit_type, Number x)) num_lst
    in
    Some (suit_type, Ace)
    :: Some (suit_type, King)
    :: Some (suit_type, Queen)
    :: Some (suit_type, Jack)
    :: card_num_lst
  in
  let deck =
    make_set_one Clubs () @ make_set_one Spades ()
    @ make_set_one Diamonds ()
    @ make_set_one Hearts ()
  in
  Array.of_list deck

(** [deal_nums deck] are the indexes of the cards in the array for the
    deck that represent the initial hand of a player *)
and deal_nums deck =
  let len = Array.length deck - 1 in
  Random.self_init ();
  let card1 = Random.int len in
  let card2 = Random.int len in
  if card1 = card2 || deck.(card1) = None || deck.(card2) = None then
    deal_nums deck
  else (card1, card2)

(** [deal deck] is the initial hand of a player *)
and deal deck =
  let num1, num2 = deal_nums deck in
  let hand = [ deck.(num1); deck.(num2) ] in
  deck.(num1) <- None;
  deck.(num2) <- None;
  (Array.of_list hand, deck)

(** [str_suit suit] is the string representation of the [suit]*)
and str_suit suit =
  match suit with
  | Clubs -> "Clubs"
  | Spades -> "Spades"
  | Diamonds -> "Diamonds"
  | Hearts -> "Hearts"

(** [str_card card] is the string representation of the [card_typ]*)
and str_card card =
  match card with
  | Number i -> string_of_int i
  | King -> "King"
  | Queen -> "Queen"
  | Jack -> "Jack"
  | Ace -> "Ace"

(** [str_of_card card] is the string representation of a card *)
and str_of_card card =
  match card with
  | None -> ""
  | Some (suit, c_type) -> str_card c_type ^ " of " ^ str_suit suit

(** [total_sum hand acc] is the score of the cards in the player's
    [hand]*)
and total_sum hand acc =
  match hand with
  | [] -> acc
  | h :: t -> begin
      match h with
      | Some (_, Number i) -> total_sum t (i + acc)
      | Some (_, King)
      | Some (_, Jack)
      | Some (_, Queen) ->
          total_sum t (10 + acc)
      | Some (_, Ace) ->
          if acc >= 11 then total_sum t (acc + 1)
          else total_sum t (acc + 11)
      | None -> total_sum t (acc + 0)
    end

(** [dealer_move dealer_hand human_hand deck] is the move that the
    dealer will play based on the score of their cards *)
and dealer_move dealer_hand human_hand deck =
  let lst_dealer_hand = Array.to_list dealer_hand in
  if total_sum lst_dealer_hand 0 > 17 then (
    print_endline "The dealer will not hit their hand\n";
    check_win dealer_hand human_hand)
  else (
    print_endline "The dealer will also hit their hand\n";
    let new_dealer_hand, _ = hit dealer_hand deck in
    check_win new_dealer_hand human_hand)

(** [hit hand deck] is the new hand and deck of the player after they
    are hit with another card *)
and hit hand deck =
  let card, _ = deal_nums deck in
  let new_card = deck.(card) in
  let new_hand_lst = new_card :: Array.to_list hand in
  deck.(card) <- None;
  (Array.of_list new_hand_lst, deck)

(** [check_win dealer_hand human_hand] is whether the human or the
    dealer won *)
and check_win dealer_hand human_hand =
  let dealer_hand_lst = Array.to_list dealer_hand in
  let human_hand_lst = Array.to_list human_hand in
  let sum_dealer = total_sum dealer_hand_lst 0 in
  let sum_human = total_sum human_hand_lst 0 in
  if sum_human = 21 then
    print_endline "You got a BlackJack!! Congrats, you win :)"
  else if sum_dealer = 21 then
    print_endline
      "The dealer got a BlackJack, you lost :(, better luck next time!"
  else if sum_human > 21 then
    print_endline "You went bust, you lose :(, better luck next time!"
  else if sum_dealer > 21 then
    print_endline "The dealer went bust, you win! Congratulations!"
  else if sum_human < sum_human then
    print_endline
      "Your score is lower than the dealer, you lost. Better luck next \
       time!"
  else if sum_human > sum_dealer then
    print_endline
      "Your score is greater than the dealer, you won! Congratulations!"

let init_str =
  "Welcome to \n\n\
   888     888                888       d8b                888      \n\
   888     888                888       Y8P                888      \n\
   888     888                888                          888      \n\
   88888b. 888 8888b.  .d8888b888  888 8888 8888b.  .d8888b888  888 \n\
   888 888b888    888bd88P   888  88P  888     88bd88P8    888 .88P \n\
   888  888888.d888888888     888888K   888.d888888888     888888K  \n\
   888 d88P888888  888Y88b.   888 988b  888888  888Y88b.   888  88b \n\
   88888P  888 Y888888  Y8888P888  888  888 Y888888  Y8888P888  888 \n\
  \                                     888                         \n\
  \                                    d88P                         \n\
  \                                  888P   \n\n\
  \  source: https://ascii.co.uk/art/blackjack"

let start_game () =
  print_string init_str;
  let deck = init_deck () in
  let human_hand, new_deck = deal deck in
  let dealer_hand, newer_deck = deal new_deck in
  print_endline
    ("\nThe dealer is showing the following card\n"
    ^ str_of_card dealer_hand.(1));
  print_endline
    ("\nYou have the following hand\n["
    ^ str_of_card human_hand.(0)
    ^ ", "
    ^ str_of_card human_hand.(1)
    ^ "]" ^ "\n");
  print_endline
    ("You have a total of "
    ^ string_of_int (total_sum (Array.to_list human_hand) 0));
  print_endline "Do you want to hit [h], stay [s], or quit [q]?\n>>";
  match read_line () with
  | "h"
  | "H" ->
      let new_human_hand, newer_deck2 = hit human_hand newer_deck in
      dealer_move dealer_hand new_human_hand newer_deck2
  | "s"
  | "S" ->
      dealer_move dealer_hand human_hand newer_deck
  | "q"
  | "Q" ->
      print_endline "You are exiting the game! Bye :/"
  | _ -> print_endline "Invalid entry, try again!"
