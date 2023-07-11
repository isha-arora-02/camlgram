(* This is the ascii art we created to represent number of fingers for
   each hand *)
let won = ref false

let comp_1 =
  "                                                                  \n\
  \                                                                         \n\
  \    _______            \n\
   ---'  (____)_____    \n\
  \            _____)    \n\
  \      (_____)         \n\
  \      (____)          \n\
   ---.__(___)            \n"

let comp_2 =
  "                                                                  \n\
  \                                                                          \n\
  \     _______            \n\
  \ ---'  (____)_____    \n\
  \             _____)    \n\
  \             _____)         \n\
  \       (____)          \n\
  \ ---.__(___)            \n\
  \ "

let comp_3 =
  "                                                                  \n\
  \                                                                          \n\
  \     _______            \n\
  \ ---'  (____)_____    \n\
  \             _____)_    \n\
  \            ________)         \n\
  \            _____)          \n\
  \ ---.__(___)            \n\
  \ "

let comp_4 =
  "                                                                  \n\
  \                                                                          \n\
  \     _______            \n\
  \ ---'  (____)_____    \n\
  \             _____)_    \n\
  \            ________)         \n\
  \            _____)          \n\
  \ ---.__________)            \n\
  \ "

let comp_fist =
  " \n\
  \    \n\
  \      _______\n\
  \  ---'   ____)\n\
  \        (_____)\n\
  \        (_____)\n\
  \        (____)\n\
  \  ---.__(___)\n"

let player_1 =
  "  \n\n\
  \       \
   _______                                                                  \n\
  \ _____(____)  \
   '---                                                              \n\
   (_____ \n\
  \      (_____)   \n\
  \      (____)   \n\
  \      (___)__.----    \n"

let player_2 =
  "      \n\n\
  \         \
   _______                                                                  \n\
  \   _____(____)  \
   '---                                                              \n\
  \ _(_____ \n\
   (_______ ____ \n\
  \        (____)   \n\
  \        (___)__.----    \n"

let player_3 =
  "   \n\n\
  \         \
   _______                                                                  \n\
  \   _____(____)  \
   '---                                                              \n\
  \ _(_____ \n\
   (_______   \n\
  \  (_____ ___   \n\
  \        (___)__.----    \n"

let player_4 =
  "     \n\n\
  \         \
   _______                                                                  \n\
  \   _____(____)  \
   '---                                                              \n\
  \ _(_____ \n\
   (_______   \n\
  \  (____    \n\
  \    (__________.----    \n"

let player_fist =
  "     \n\n\
  \         \
   _______                                                                  \n\
  \        (____)  \
   '---                                                            \n\
  \        (_____ \n\
  \       (_____)   \n\
  \        (____)   \n\
  \        (___)__.----    \n"

(* Ascii art for the game over message *)
let game_over =
  "\n\n\n\
  \  █▀▀ ▄▀█ █▀▄▀█ █▀▀   █▀█ █░█ █▀▀ █▀█\n\
  \  █▄█ █▀█ █░▀░█ ██▄   █▄█ ▀▄▀ ██▄ █▀▄\n\n\
  \  "

(* This is the ascii art representation of initial set up of game
   board*)
let board_init () =
  print_string "Computer:\n";
  print_string ("L:    " ^ comp_1 ^ " \n");
  print_string ("R:    " ^ comp_1 ^ " \n");
  print_string
    "--------------------------------------------------------\n";
  print_string "Player:\n";
  print_string ("L:    " ^ player_1 ^ " \n");
  print_string ("R:    " ^ player_1 ^ " \n")

type count = {
  mutable left : int;
  mutable right : int;
}

let computer_init = { left = 1; right = 1 }

let player_init = { left = 1; right = 1 }

let computer_curr = ref computer_init

let player_curr = ref player_init

let inc_left c x () = c.left <- c.left + x

let inc_right c x () = c.right <- c.right + x

let reset () =
  player_curr := player_init;
  computer_curr := computer_init

let in_play = ref true

(** [turn ()] handles asking the user's input for every turn *)
let rec turn () =
  if !in_play = true then (
    print_string
      "What hand do you want to attack with? Type L for left and R for \
       right.\n";
    print_string ">> ";
    match read_line () with
    | "L" -> dead_left "L" ()
    | "l" -> dead_left "l" ()
    | "R" -> dead_right "R" ()
    | "r" -> dead_right "r" ()
    | _ ->
        print_string "Invalid Option. Please try again. ";
        turn ())
  else end_game ()

(** [dead_left h ()] keeps track of whether the left hand is dead or not *)
and dead_left h () =
  if !player_curr.left >= 5 then (
    print_string "This hand is dead. Try the other.\n";
    turn ())
  else hand h ()

(** [dead_rihgt h ()] keeps track of whether the right hand is dead or
    not *)
and dead_right h () =
  if !player_curr.right >= 5 then (
    print_string "This hand is dead. Try the other.\n";
    turn ())
  else hand h ()

(** [turn_init ()] handles the initial turn at the beginning of the game *)
and turn_init () =
  print_string "Let's get started! How about you go first? \n";
  print_string ">> ";
  print_string
    "What hand do you want to attack with? Type L for left and R for \
     right.\n";
  print_string ">> ";
  match read_line () with
  | "L" -> hand "L" ()
  | "l" -> hand "l" ()
  | "R" -> hand "R" ()
  | "r" -> hand "r" ()
  | _ ->
      print_string "Invalid Option. Please try again. ";
      turn ()

(** [hand h ()] handles the user's choice of attack on computer's
    fingers *)
and hand h () =
  match h with
  | "L" -> attack_left h ()
  | "l" -> attack_left h ()
  | "R" -> attack_right h ()
  | "r" -> attack_right h ()
  | _ -> print_string "Invalid Option. Please try again."

(** [attack_left h ()] handles the user's left hand attack on computer's
    fingers *)
and attack_left h () =
  print_string
    "You have selected your left hand. Now choose the hand of the \
     opponent you want to attack. Type L for left and R for right. \n";
  print_string ">> ";
  let choice = read_line () in
  match choice with
  | "L" -> dead_comp_left h "l" "L" ()
  | "l" -> dead_comp_left h "l" "l" ()
  | "R" -> dead_comp_right h "l" "R" ()
  | "r" -> dead_comp_right h "l" "r" ()
  | _ ->
      print_string "Invalid Option. Please try again. ";
      hand h ()

(** [dead_comp_left h ()] handles the case in which the computer's left
    hand is dead *)
and dead_comp_left h s1 s2 () =
  if !computer_curr.left >= 5 then (
    print_string "This hand is dead. Try the other. \n";
    hand h ())
  else comp_hand s1 s2 ()

(** [dead_comp_right h ()] handles the case in which the computer's
    right hand is dead *)
and dead_comp_right h s1 s2 () =
  if !computer_curr.right >= 5 then (
    print_string "This hand is dead. Try the other. \n";
    hand h ())
  else comp_hand s1 s2 ()

(** [attack_right h ()] handles the user's right hand attack on
    computer's fingers *)
and attack_right h () =
  print_string
    "You have selected your right hand. Now choose the hand of the \
     opponent you want to attack. Type L for left and R for right.\n";
  print_string ">> ";
  let choice = read_line () in
  match choice with
  | "L" -> dead_comp_left h "r" "L" ()
  | "l" -> dead_comp_left h "r" "l" ()
  | "R" -> dead_comp_right h "r" "R" ()
  | "r" -> dead_comp_right h "r" "r" ()
  | _ ->
      print_string "Invalid Option. Please try again. ";
      hand h ()

(** [pick_player_left s ()] handles the computer's attack on the user's
    left hand *)
and pick_player_left s () =
  print_string "Attacking the left hand.";
  begin
    match s with
    | "L" ->
        inc_left !player_curr !computer_curr.left ();
        print_string " Computer is attacking with its left hand. \n"
    | "R" ->
        inc_left !player_curr !computer_curr.right ();
        print_string " Computer is attacking with its right hand. \n"
    | _ ->
        print_string "Invalid Option. Please try again. ";
        comp_turn ()
  end;
  update_board !computer_curr.left !computer_curr.right
    !player_curr.left !player_curr.right ();
  turn ()

(** [pick_player_right s ()] handles the computer's attack on the user's
    right hand *)
and pick_player_right s () =
  print_string "Attacking the right hand.";
  begin
    match s with
    | "L" ->
        inc_right !player_curr !computer_curr.left ();
        print_string " Computer is attacking with its left hand. \n"
    | "R" ->
        inc_right !player_curr !computer_curr.right ();
        print_string " Computer is attacking with its right hand. \n"
    | _ ->
        print_string "Invalid Option. Please try again. ";
        comp_turn ()
  end;
  update_board !computer_curr.left !computer_curr.right
    !player_curr.left !player_curr.right ();
  turn ()

(** [pick_player s h ()] handles incrementing the player's fingers based
    on the computer generated choice*)
and pick_player s h () =
  if !player_curr.left >= 5 && (h = "L" || h = "l") then
    pick_player s "R" ()
  else if !player_curr.right >= 5 && (h = "R" || h = "r") then
    pick_player s "L" ()
  else if !computer_curr.left >= 5 && (s = "L" || s = "l") then
    pick_player "R" h ()
  else if !computer_curr.right >= 5 && (s = "R" || s = "r") then
    pick_player "L" h ()
  else
    match h with
    | "L" -> pick_player_left s ()
    | "l" -> pick_player_left s ()
    | "R" -> pick_player_right s ()
    | "r" -> pick_player_right s ()
    | _ -> print_string "Invalid Option. Please try again. "

(** [comp_incl s ()] increments the fingers on the computers' left hand
    based on the user's input *)
and comp_incl s () =
  print_string "You have selected the opponent's left hand. \n";
  begin
    match s with
    | "l" -> inc_left computer_init !player_curr.left ()
    | "r" -> inc_left computer_init !player_curr.right ()
    | _ ->
        print_string "Invalid Option. Please try again. ";
        turn ()
  end;
  update_board !computer_curr.left !computer_curr.right
    !player_curr.left !player_curr.right ();
  comp_turn ()

(** [comp_incr s ()] increments the fingers on the computers' right hand
    based on the user's input *)
and comp_incr s () =
  print_string "You have selected the opponent's right hand.\n";
  begin
    match s with
    | "l" -> inc_right computer_init !player_curr.left ()
    | "r" -> inc_right computer_init !player_curr.right ()
    | _ ->
        print_string "Invalid Option. Please try again. ";
        turn ()
  end;
  update_board !computer_curr.left !computer_curr.right
    !player_curr.left !player_curr.right ();
  comp_turn ()

(** [comp_hand s h ()] increments the computers' fingers based on the
    user's input *)
and comp_hand s h () =
  match h with
  | "L" -> comp_incl s ()
  | "l" -> comp_incl s ()
  | "R" -> comp_incr s ()
  | "r" -> comp_incr s ()
  | _ -> print_string "Invalid Option. Please try again. "

(** [comp_turn ()] randomly generates an integer to decide whether it
    picks the left or right hand *)
and comp_turn () =
  if !in_play = true then (
    print_string "\n \nNow it is the computer's turn. ";
    if Random.int 5000 mod 2 = 0 then pick_player "L" "R" ()
    else pick_player "R" "L" ())
  else end_game ()

and end_game () = in_play := false

(** [compare_comp l r] compares the number of fingers with the
    corresponding ascii art image *)
and compare_comp l r =
  let comp_left =
    match l with
    | 1 -> comp_1
    | 2 -> comp_2
    | 3 -> comp_3
    | 4 -> comp_4
    | 5 -> comp_fist
    | _ -> comp_fist
  in
  let comp_right =
    match r with
    | 1 -> comp_1
    | 2 -> comp_2
    | 3 -> comp_3
    | 4 -> comp_4
    | 5 -> comp_fist
    | _ -> comp_fist
  in

  (comp_left, comp_right)

(** [compare_comp l r] compares the number of fingers with the
    corresponding ascii art image *)
and compare_player l r =
  let player_left =
    match l with
    | 1 -> player_1
    | 2 -> player_2
    | 3 -> player_3
    | 4 -> player_4
    | 5 -> player_fist
    | _ -> player_fist
  in
  let player_right =
    match r with
    | 1 -> player_1
    | 2 -> player_2
    | 3 -> player_3
    | 4 -> player_4
    | 5 -> player_fist
    | _ -> player_fist
  in
  (player_left, player_right)

(** [update_board cl cr pl pr ()] handles updating the board with the
    appropriate hand images*)
and update_board cl cr pl pr () =
  let cl' = fst (compare_comp cl cr) in
  let cr' = snd (compare_comp cl cr) in
  let pl' = fst (compare_player pl pr) in
  let pr' = snd (compare_player pl pr) in

  print_string "\n \n \n Computer:\n";
  print_string ("L:    " ^ cl' ^ " \n");
  print_string ("R:    " ^ cr' ^ " \n");
  print_string
    "--------------------------------------------------------\n";
  print_string "Player:\n";
  print_string ("L:    " ^ pl' ^ " \n");
  print_string ("R:    " ^ pr' ^ " \n");

  if cl' = comp_fist && cr' = comp_fist then (
    print_string "\n\nYOU WIN! CONGRATS 🥳 \n";
    won := true;
    print_string game_over;
    end_game ())
  else if pl' = player_fist && pr' = player_fist then (
    print_string "\n\nYOU LOST! BETTER LUCK NEXT TIME 😭 \n";
    won := false;
    print_string game_over;
    end_game ())

and init_string = "\n\n\
\                                                                                                                                                                                                         \n\
\  ***** *                                             ***** **  \
 ***                                      * ***      \
 *                                                                 \
 *                 \n\
\  ******  *                   *                       ******  \
 ****  ***                                   *  ****  * \
 **                                         *      *               \
 **                  \n\
\ **   *  *                   **                      **   *  *  \
 ***  **                                  *  *  ****  \
 **                                        **     ***              \
 **                  \n\
 *    *  *                    **                     *    *  *    \
 *** **                                 *  **   **   \
 **                                        **      *               \
 **                  \n\
\    *  *                   ********   ****              *  *      \
 ** **             **   ****          *  ***        **           \
 ****     ****     ****     ********                  **         \
 ****     \n\
\   ** **              *** ********   * **** *          ** **      \
 ** **      ****    **    ***  *     **   **        **  ***     * \
 ***  * * ***  * * **** * ******** ***       ****    **  ***   * \
 **** *  \n\
\   ** **             * ***   **     **  ****           ** **      \
 ** **     * ***  * **     ****      **   **        ** * ***   *   \
 **** *   **** **  ****     **     ***     * ***  * ** * *** **  \
 ****   \n\
\   ** **            *   ***  **    ****              **** **      \
 *  **    *   ****  **      **       **   **        ***   *** \
 **    ** **    ** ****          **      **    *   ****  ***   * \
 ****        \n\
\   ** **           **    *** **      ***            * *** **     \
 *   **   **    **   **      **       **   **        **     ** \
 **    ** **    **   ***         **      **   **         **   *    \
 ***      \n\
\   ** **           ********  **        ***             ** \
 *******    **   **    **   **      **       **   **        **     \
 ** **    ** **    **     ***       **      **   **         **  \
 *       ***    \n\
\   *  **           *******   **          ***           ** \
 ******     **   **    **   **      **        **  **        **     \
 ** **    ** **    **       ***     **      **   **         ** \
 **         *** \n\
\      *            **        **     ****  **           ** \
 **         **   **    **   **      **         ** *      *  **     \
 ** **    ** **    **  ****  **     **      **   **         \
 ******   ****  ** \n\
\  ****           * ****    * **    * **** *            ** \
 **         **   **    **    *********          ***     *   **     \
 **  ******  *******  * **** *      **      **   ***     *  **  \
 *** * **** *   \n\
\ *  *************   *******   **      ****             ** \
 **         *** * ***** **     **** ***          *******    **     \
 **   ****   ******      ****        **     *** * *******   **   \
 *** * ****    \n\
 *     *********      *****                        **   ** \
 **          ***   ***   **          ***           ***       **    \
 **          **                              ***   *****     **   \
 ***          \n\
 *                                                ***   *  \
 *                            *****   ***                          \
 *           \
 **                                                                \n\
\ **                                               ***    \
 *                           ********  **                          \
 *            \
 **                                                                \n\
\                                                   \
 ******                           *      \
 ****                           *              \
 **                                                               \n\
\                                                     \
 ***                                                                 \
 *                                                                                \n\
\                                                                                                                                                                                                           \n\
\  source : https://onlineasciitools.com/convert-text-to-ascii-art \n\
\   \n\
\ \n\
 You will be playing against the computer. \n"

(** [start_game ()] starts the game for the user by printing out the
    ascii art and rules of the game*)
and start_game () =
  won := false;
  print_string init_string;
  print_string "Here are some basic rules: \n";
  print_string
    "Each player begins with one finger raised on each hand. \n";
  print_string
    "To attack, a player uses one of their live hands to strike an \
     opponent's live hand. The number of fingers on the opponent's \
     struck hand will increase by the number of fingers on the hand \
     used to strike. \n";
  print_string
    "If any hand of any player reaches exactly five fingers, then the \
     hand is killed (shown by a closed fist).\n";
  print_string
    "When a player has two dead hands, they can no longer play and the \
     game is over.\n";
  print_string "\n";
  board_init ();
  reset ();
  turn_init ()
