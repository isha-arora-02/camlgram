let won = ref false

let string_board =
  "\n\
   c     |   |  \n\
  \  --------------\n\
   b     |   |       \n\
  \  --------------\n\
   a     |   |       \n\
  \   a    b    c   \n\n\n"

let x_player = " X "

let o_player = " O "

let board_divider = "  -------------\n"

(*let last_moved = ""*)

(** [board_init ()] initializes the board as the form of an array *)
let board_init () =
  let board = Array.make 9 None in
  board.(0) <- Some (0, 0);
  board.(1) <- Some (1, 0);
  board.(2) <- Some (2, 0);
  board.(3) <- Some (0, 1);
  board.(4) <- Some (1, 1);
  board.(5) <- Some (2, 1);
  board.(6) <- Some (0, 2);
  board.(7) <- Some (1, 2);
  board.(8) <- Some (2, 2);
  board

let board_str_init () = Array.make 9 "   "

(** [xo_selection ()] chooses X or O *)
let rec xo_selection () =
  let rand_int = Random.int 1 in
  if rand_int = 0 then x_player else o_player

(** [print_row num_y board_str] is the row given by number [num_y] *)
and print_row num_y board_str =
  if num_y = 0 then print_string "   a    b    c   "
  else if num_y = 1 then
    print_string
      ("a " ^ board_str.(0) ^ "|" ^ board_str.(1) ^ "|" ^ board_str.(2)
     ^ "\n")
  else if num_y = 2 then
    print_string
      ("b " ^ board_str.(3) ^ "|" ^ board_str.(4) ^ "|" ^ board_str.(5)
     ^ "\n")
  else
    print_string
      ("c " ^ board_str.(6) ^ "|" ^ board_str.(7) ^ "|" ^ board_str.(8)
     ^ "\n")

(** [choose_who_moves xo board board_str last_moved ()] determines whether the computer 
or the human player will move next*)     
and choose_who_moves xo board board_str last_moved () =
  if xo = " O " && last_moved = " X " then
    make_human_move xo board board_str ()
  else if xo = " X " && last_moved = " O " then
    make_human_move xo board board_str ()
  else if xo = " O " && last_moved = " O " then
    make_computer_move xo board board_str ()
  else if xo = " X " && last_moved = " X " then
    make_computer_move xo board board_str ()

(** [print_board index xo position board board_str] is the current board
    after a move is made *)
and print_board index xo xo_print position board board_str last_moved ()
    =
  match position with
  | None -> choose_who_moves xo board board_str last_moved ()
  | Some _ ->
      board_str.(index) <- xo_print;
      print_row 3 board_str;
      print_string board_divider;
      print_row 2 board_str;
      print_string board_divider;
      print_row 1 board_str;
      print_row 0 board_str;
      print_string "\n"

(** [make_computer_move board] makes the move for the computer *)
and make_computer_move xo board board_str () =
  let num_available_spots = Array.length board - 1 in
  let placement_index = Random.int num_available_spots in
  let chosen_position = board.(placement_index) in
  if chosen_position = None then
    make_computer_move xo board board_str ()
  else
    let xo_opp = if xo = " X " then " O " else " X " in
    print_string "Now, the computer will move.\n";
    print_board placement_index xo xo_opp chosen_position board
      board_str xo_opp ();
    board.(placement_index) <- None;
    if xo = " X " then game_play xo board board_str " O " ()
    else game_play xo board board_str " X " ()

(** [get_index_choice xo ()] is the position at which the player will
place their [xo] *)    
and get_index_choice xo () =
  print_endline ("Where do you want to place your" ^ xo ^ "?");
  let choice = read_line () in
  match choice with
  | "(a, a)" -> 0
  | "(b, a)" -> 1
  | "(c, a)" -> 2
  | "(a, b)" -> 3
  | "(b, b)" -> 4
  | "(c, b)" -> 5
  | "(a, c)" -> 6
  | "(b, c)" -> 7
  | "(c, c)" -> 8
  | _ ->
      print_string "Invalid entry, try again.\n";
      get_index_choice xo ()

(** [make_human_move board] makes the move for the human *)
and make_human_move xo board board_str () =
  let placement_index = get_index_choice xo () in
  let chosen_position = board.(placement_index) in
  if chosen_position = None then (
    print_string "This position is taken, try again!\n";
    make_human_move xo board board_str ())
  else
    print_board placement_index xo xo chosen_position board board_str xo
      ();
  board.(placement_index) <- None;
  if xo = " X " then game_play xo board board_str " X " ()
  else game_play xo board board_str " O " ()

(** [first_move xo board board_str ()] determines whether the computer or the 
human will take the first move *)  
and first_move xo board board_str () =
  if xo = " O " then make_computer_move xo board board_str ()
  else make_human_move xo board board_str ()

(** [check_win board_str ()] is a boolean representing whether the player
has won or not *)  
and check_win board_str () =
  let str_0 = board_str.(0) in
  let str_1 = board_str.(1) in
  let str_2 = board_str.(2) in
  let str_3 = board_str.(3) in
  let str_4 = board_str.(4) in
  let str_5 = board_str.(5) in
  let str_6 = board_str.(6) in
  let str_7 = board_str.(7) in
  let str_8 = board_str.(8) in
  check_cond str_0 str_1 str_2 str_3 str_4 str_5 str_6 str_7 str_8

(** [check_cond str_0 str_1 str_2 str_3 str_4 str_5 str_6 str_7 str_8] checks whether 
  the three positions have been filled in order *)  
and check_cond str_0 str_1 str_2 str_3 str_4 str_5 str_6 str_7 str_8  =
  if str_0 <> "   " && str_0 = str_4 && str_0 = str_8 then (true, str_0)
  else if str_6 <> "   " && str_6 = str_4 && str_6 = str_2 then
    (true, str_2)
  else if str_6 <> "   " && str_6 = str_7 && str_6 = str_8 then
    (true, str_6)
  else if str_3 <> "   " && str_3 = str_4 && str_3 = str_5 then
    (true, str_3)
  else if str_0 <> "   " && str_0 = str_1 && str_0 = str_2 then
    (true, str_2)
  else if str_0 <> "   " && str_0 = str_3 && str_0 = str_6 then
    (true, str_0)
  else if str_1 <> "   " && str_1 = str_4 && str_1 = str_7 then
    (true, str_1)
  else if str_2 <> "   " && str_2 = str_5 && str_2 = str_8 then
    (true, str_2)
  else (false, "   ")

(** [game_play xo board] is the function controlling the game play *)
and game_play xo board board_str last_moved () =
  if last_moved = "" then first_move xo board board_str ()
  else
    let win = check_win board_str () in
    if fst win = false then
      if Array.mem "   " board_str then
        choose_who_moves xo board board_str last_moved ()
      else print_string "It's a tie!\n"
    else
      let winner_sign = snd win in
      if xo = winner_sign then (
        print_string "Congratulations, you won!\n";
        won := true)
      else (
        print_string "The computer won, better luck next time!\n";
        won := false)

(** [intro_string] is what is to be printed to the screen when the game starts up*)
and intro_string = "Welcome to \n\
\   _____                ____       _____      _        ____       \
 _____   U  ___ uU _____ u \n\
\  |_   _|     ___    o / ___|     |_   _|  o | |  u U / ___|     \
 |_   _|   || _ |||| ___ |/ \n\
\    | |      |_ _|   || | u         | |    || _ ||  || | \
 u         | |     | | | | |  _|   \n\
\   || ||      | |     | |/__       || ||   | ___ |   | |/__       \
 /| ||.-,_| |_| | | |___   \n\
\  u |_|U    U|| ||u    |____|     u |_|U  |_|   |_|   |____|     \
 u |_|U |_)-|___|  |_____|  \n\
\  _|| ||_.-,_|___|_,-._|| ||      _|| ||_  ||    >>  _|| ||      \
 _|| ||_     ||    <<   >>  \n\
\ (__) (__)|_)-' '-(_/(__)(__)    (__) (__)(__)  (__)(__)(__)    \
 (__) (__)   (__)  (__) (__)\n\
\  source : \
 https://patorjk.com/software/taag/#p=display&f=Dancing%20Font&t=Tic%20Tac%20Toe \n\
\  ! \n\
\ \n\
\ You will be playing against the computer. \n"

(** [start_game ()] starts the game for the user *)
and start_game () =
  won := false;
  print_string intro_string;
  print_string "Below is the board we are using: \n";
  print_string string_board;
  let x_or_o = xo_selection () in
  if x_or_o = " X " then print_string "You will be X. You go first. "
  else print_string "You will be O.";
  print_string
    ("In order to place your " ^ x_or_o
   ^ ", you need to input the coordinates of the position\n\
     \  when asked for your move. For example (a, a) will refer to the \
      cartesian coordinates (0, 0).\n");
  print_endline "Let's Begin!";
  let new_board = board_init () in
  let board_strs = board_str_init () in
  game_play x_or_o new_board board_strs "" ()