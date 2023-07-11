(**source:
   https://gist.github.com/chrishorton/8510732aa9a80a03c829b09f12e20d9c*)

let won = ref false

type state =
  | Zero
  | One
  | Two
  | Three
  | Four
  | Five
  | Six

let zerowrong =
  "\n +---+\n |   |\n     |\n     |\n     |\n     |\n========="

let onewrong =
  "\n +---+\n |   |\n O   |\n     |\n     |\n     |\n========="

let twowrong =
  "\n +---+\n |   |\n O   |\n |   |\n     |\n     |\n========="

let threewrong =
  "\n +---+\n |   |\n O   |\n/|   |\n     |\n     |\n========="

let fourwrong =
  "\n +---+\n |   |\n O   |\n/|\\  |\n     |\n     |\n========="

let fivewrong =
  "\n +---+\n |   |\n O   |\n/|\\  |\n/    |\n     |\n========="

let sixwrong =
  "\n +---+\n |   |\n O   |\n/|\\  |\n/ \\  |\n     |\n========="

(** Ascii art for the hangman welcome screen.*)
let hangman_str =
  "Welcome to \n\
   888                                                           \n\
   888                                                           \n\
   888                                                           \n\
   88888b.  8888b. 88888b.  .d88b. 88888b.d88b.  8888b. 88888b.  \n\
   888  88b     88b888  88bd88  88b888  888  88b     88b888  88b \n\
   888  888.d888888888  888888  888888  888  888.d888888888  888 \n\
   888  888888  888888  888Y88b 888888  888  888888  888888  888 \n\
   888  888 Y888888888  888  Y88888888  888  888 Y888888888  888 \n\
  \                             888                              \n\
  \                        Y8b d88P                              \n\
  \                          Y88P     \n\
  \  source : https://ascii.co.uk/art/hangman\n\
  \  ! \n\
  \ \n\
  \    You will be playing against the computer. \n"

let words_init =
  let csv_info = Csv.load "src/word_bank.csv" in
  let row1 =
    match csv_info with
    | h :: _ -> h
    | _ -> failwith "Data has not been input in the correct format"
  in
  Array.of_list row1

(** [generate_word] creates a new word for the player to guess.*)
let generate_word () =
  let random_int = Random.int (Array.length words_init) in
  words_init.(random_int)

let w = ref (generate_word ())

(**[let_guess] is the representation of the letters that the player has
   guessed so far.*)
let (let_guess : string list ref) = ref []

(**[guessed_letters] takes in an array and returns a string
   representation of the letters that the player has guessed so far.*)
let guessed_letters lg =
  List.fold_left (fun acc x -> x ^ " " ^ acc) "" lg

(** [array_word] is the array representation of the word, with a "-"
    representing a letter that has not been guessed.*)
let array_word = ref (Array.make (String.length !w) "-")

(**string_of_curr_word takes in an array representation of the current
   state of the word and returns its string representation.*)
let string_of_curr_word arr =
  Array.fold_left (fun acc x -> acc ^ x) "" arr

(**[change_dashes] takes in a character and returns an array with the
   new string representation of the word. *)
let change_dashes c =
  Array.iteri
    (fun i x ->
      if String.get !w i = c then !array_word.(i) <- Char.escaped c
      else if false then !array_word.(i) <- x)
    !array_word;
  string_of_curr_word !array_word

(**[complete] returns true if the word is complete.*)
let complete () =
  not (String.contains (string_of_curr_word !array_word) '-')

(* [string_to_char] takes in a string and returns the character
   representation. RI: Requires that s has length 1*)
let string_to_char s = (String.uppercase_ascii s).[0]

(**[is_valid_letter] takes in a char and returns true if it a valid
   letter.*)
let is_valid_letter c =
  if
    String.contains
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" c
  then true
  else false

(** [state_string] returns the string representation associated with a
    given state.*)
let state_string x =
  match x with
  | Zero -> zerowrong
  | One -> onewrong
  | Two -> twowrong
  | Three -> threewrong
  | Four -> fourwrong
  | Five -> fivewrong
  | Six -> sixwrong

(** [state_plus] increments the current state.*)
let state_plus x =
  match x with
  | Zero -> One
  | One -> Two
  | Two -> Three
  | Three -> Four
  | Four -> Five
  | Five -> Six
  | Six -> failwith "game over"

let statecurr = ref Zero

(**[refresh] re-initializes the game prior to game play*)
let refresh () =
  statecurr := Zero;
  w := generate_word ();
  array_word := Array.make (String.length !w) "-";
  let_guess := []

(**[letter_correct] takes in a character and handles the progression of
   the game if the letter that the player guesses is in the word.*)
let rec letter_correct c () =
  let_guess := Char.escaped c :: !let_guess;
  print_string (state_string !statecurr ^ "\n");
  print_string (change_dashes c ^ "\n");
  if not (complete ()) then (
    print_string
      ("\n Letters already guessed: " ^ guessed_letters !let_guess);
    guess_letter ())
  else end_game ()

(**[letter_incorrect c ()] takes in a character and handles the
   progression of the game if the letter that the player guesses is not
   in the word.*)
and letter_incorrect c () =
  let_guess := Char.escaped c :: !let_guess;
  statecurr := state_plus !statecurr;
  if !statecurr = Six then end_game ();
  if !statecurr <> Six then (
    print_string (state_string !statecurr ^ "\n");
    print_string (change_dashes c ^ "\n");
    print_string
      ("Letters already guessed: " ^ guessed_letters !let_guess);
    guess_letter ())

(**[guess_letter()] handles the user's guess for the letter.*)
and guess_letter () =
  print_string "\nGuess a letter:  \n>>";
  let c = read_line () in
  match is_valid_letter (string_to_char c) with
  | false ->
      print_string "invalid letter. try again! \n";
      guess_letter ()
  | true ->
      if String.contains !w (string_to_char c) then
        letter_correct (string_to_char c) ()
      else letter_incorrect (string_to_char c) ()

(**[hang_init()] initializes the hangman game.*)
and hang_init () =
  print_string (state_string !statecurr ^ "\n");
  let x = string_of_curr_word !array_word in
  print_string x;
  print_string "\nLetters already guessed: "

(**[end_game()] handles the conclusion of the hangman game.*)
and end_game () =
  print_string (state_string !statecurr);
  print_string "\n GAME OVER! ";
  if complete () then (
    print_string "\n YOU WON! CONGRATS! ";
    won := true)
  else (
    print_string "\n YOU LOST! BETTER LUCK NEXT TIME! ";
    won := false)

(**[end_game()] handles the start of the hangman game.*)
and start_game () =
  won := false;
  print_string hangman_str;
  refresh ();
  hang_init ();
  guess_letter ();
  ()
