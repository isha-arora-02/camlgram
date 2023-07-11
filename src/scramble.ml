let score = ref (max_int, "--")

(** [words_init] initializes the words into an array from the csv data *)
let words_init =
  let csv_info = Csv.load "src/word_bank.csv" in
  let row1 =
    match csv_info with
    | h :: _ -> h
    | _ -> failwith "Data has not been input in the correct format"
  in
  Array.of_list row1

(** [scramble_init] initializes the scrambled words into an array from
    the csv data *)
let scramble_init =
  let csv_info = Csv.load "src/word_bank.csv" in
  let row2 =
    match csv_info with
    | _ :: h2 :: _ -> h2
    | _ -> failwith "Data has not been input in the correct format"
  in
  Array.of_list row2

(** [counter] is a list of already prompted words *)
let counter = ref []

(** [attempts] is the number of attempts the user has made *)
let attempts = ref 0

(** [finished] is whether the game has finished or not *)
let finished = ref false

(** [game_over] is the message to be displayed when the game is over *)
let game_over =
  "\n\n\
  \  █▀▀ ▄▀█ █▀▄▀█ █▀▀   █▀█ █░█ █▀▀ █▀█\n\
  \  █▄█ █▀█ █░▀░█ ██▄   █▄█ ▀▄▀ ██▄ █▀▄\n\n\
  \  "

(** [guess_word] prompts the user to guess the word corresponding to
    [random_int] in the array of words *)
let rec guess_word random_int =
  if !attempts < 3 then (
    attempts := !attempts + 1;
    print_string "\nEnter your guess! \n>> ";
    match read_line () with
    | "#quit" ->
        finished := true;
        attempts := 0;
        counter := []
    | x ->
        if x = words_init.(random_int) then (
          attempts := 0;
          print_string "You guessed the word!")
        else (
          print_string "\nNot quite, try again!\n";
          guess_word random_int))
  else (
    print_string "\nYou are out of attempts. Let's try another word!";
    attempts := 0;
    generate_word ())

(** [generate_word] generates a random word for the user to unscramble *)
and generate_word () =
  let random_int = Random.int (Array.length words_init) in
  if List.length !counter = Array.length words_init then (
    counter := [];
    generate_word ())
  else if List.mem random_int !counter then generate_word ()
  else (
    counter := random_int :: !counter;
    print_string "\n\n💥 Here is the word you must unscramble 💥\n";
    print_string scramble_init.(random_int);
    guess_word random_int)

(** [print_score] prints out the string representation of the time taken
    to guess five words [s] to the user *)
let print_score s =
  print_string
    ("\n\nGreat job! You guessed five words in a row. Your time was "
   ^ s ^ "\n");
  print_string game_over

(** [str_time] prints out a string representation of the time in seconds
    [d] *)
let str_time d =
  let hours =
    if d / 3600 < 10 then "0" ^ string_of_int (d / 3600)
    else string_of_int (d / 3600)
  in
  let minutes =
    if d mod 3600 / 60 < 10 then "0" ^ string_of_int (d mod 3600 / 60)
    else string_of_int (d mod 3600 / 60)
  in
  let seconds =
    if d mod 60 < 10 then "0" ^ string_of_int (d mod 60)
    else string_of_int (d mod 60)
  in
  hours ^ ":" ^ minutes ^ ":" ^ seconds

(** [print_time] prints the time taken to guess 5 words *)
let print_time d = print_score (str_time d)

(** [intiial_str] is the initial ascii art to be displayed*)
let initial_str =
  "                                                   Welcome to\n\
  \  _     _  _______  ______    ______     _______  _______  \
   ______    _______  __   __  _______  ___      _______ \n\
  \  | | _ | ||       ||    _ |  |      |   |       ||       ||    _ \
   |  |   _   ||  |_|  ||  _    ||   |    |       |\n\
  \  | || || ||   _   ||   | ||  |  _    |  |  _____||       ||   | \
   ||  |  |_|  ||       || |_|   ||   |    |    ___|\n\
  \  |       ||  | |  ||   |_||_ | | |   |  | |_____ |       ||   \
   |_||_ |       ||       ||       ||   |    |   |___ \n\
  \  |       ||  |_|  ||    __  || |_|   |  |_____  ||      _||    __  \
   ||       ||       ||  _   | |   |___ |    ___|\n\
  \  |   _   ||       ||   |  | ||       |   _____| ||     |_ |   |  | \
   ||   _   || ||_|| || |_|   ||       ||   |___ \n\
  \  |__| |__||_______||___|  |_||______|   |_______||_______||___|  \
   |_||__| |__||_|   |_||_______||_______||_______|\n\n\
  \                 source: \
   http://patorjk.com/software/taag/#p=display&f=Slant&t=Word%20Scramble \n"

(** [instructions] is the instructions to be displayed to the user *)
let instructions =
  "\n\
   INSTRUCTIONS: A series of scrambled words will appear on the \
   screen. Your objective is to unscramble 5 words as quickly as \
   possible. \n\
   You may type #quit if you give up, but do your best to persevere!"

(** [handle_finished] handles the time *)
let handle_finished (start_time : Unix.tm) =
  let end_time = Unix.localtime (Unix.time ()) in
  let seconds_start =
    (start_time.tm_hour * 3600)
    + (start_time.tm_min * 60)
    + start_time.tm_sec
  in
  let seconds_end =
    (end_time.tm_hour * 3600) + (end_time.tm_min * 60) + end_time.tm_sec
  in
  let difference = seconds_end - seconds_start in
  print_time difference;
  score := (difference, str_time difference)

let start_game () =
  score := (0, "");
  print_string initial_str;
  print_string instructions;
  finished := false;
  generate_word ();
  let start_time = Unix.localtime (Unix.time ()) in
  if !finished = false then generate_word ();
  if !finished = false then generate_word ();
  if !finished = false then generate_word ();
  if !finished = false then generate_word ();
  if !finished = false then handle_finished start_time
