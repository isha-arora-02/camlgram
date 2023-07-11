(** This initializes the chat screen for the instant messaging system. *)

(** [menu] is a string representation of the possible commands *)
let menu =
  "\n\
   +-+-+-+-+\n\
   |M|e|n|u|\n\
   +-+-+-+-+ \n\
   Create a new chat with another user : #chat \n\
   Add friends to your contacts: #addcontact\n\
   Get list of text color options : #color\n\
   Change the Theme : #themes\n\
   Update Username : #updateuser\n\
   Update Password : #updatepass\n\
   Play a game! : #games\n\
   Access Calendar : #calendar\n\
   Log out : #logout\n\
   Leave Camelgram : #quit\n\
   Call the menu again : #menu\n\n"

(** [themes_menu] is a string representation of the possible themes *)
let themes_menu =
  "\n\
   +-+-+-+-+-+ +-+-+-+-+\n\
   |T|h|e|m|e| |M|e|n|u|\n\
   +-+-+-+-+-+ +-+-+-+-+ \n\
   New Year : #newyear \n\
   Valentines Day : #vday\n\
   Halloween : #halloween\n\
   Thanksgiving : #thanksgiving\n\
   Christmas : #christmas\n\
   Summer : #summer\n\
   Birthday : #bday\n\
   Original Theme : #original\n\
   Call the themes menu again : #themesmenu\n\
   Call the menu again : #menu\n\n"

(** [games_menu] is a string representation of the possible games *)
let games_menu =
  "\n\
  \ +-+-+-+-+-+ +-+-+-+-+\n\
  \ |G|a|m|e|s| |M|e|n|u|\n\
  \ +-+-+-+-+-+ +-+-+-+-+ \n\
   💥 Tic Tac Toe : #tictactoe\n\
   💥 Chopsticks : #chopsticks\n\
   💥 Word Scramble : #wordscramble\n\
   💥 Hangman : #hangman\n\
   💥 BlackJack : #blackjack\n\
   💥 Call the menu again : #menu\n\n"

let beginning_str =
  "\n\
  \                          🐪🐪 Welcome to Camlgram! 🐪🐪\n\n\
  \  /$$$$$$                          \
   /$$                                           \n\
  \ /$$__  $$                        | \
   $$                                           \n\
   | $$  |__/  /$$$$$$  /$$$$$$/$$$$ | $$  /$$$$$$   /$$$$$$  /$$$$$$  \
   /$$$$$$/$$$$ \n\
   | $$       |____  $$| $$_  $$_  $$| $$ /$$__  $$ /$$__  $$|____  \
   $$| $$_  $$_  $$\n\
   | $$        /$$$$$$$| $$ | $$ | $$| $$| $$  | $$| $$  |__/ \
   /$$$$$$$| $$ | $$ | $$\n\
   | $$    $$ /$$__  $$| $$ | $$ | $$| $$| $$  | $$| $$      /$$__  \
   $$| $$ | $$ | $$\n\
   |  $$$$$$/|  $$$$$$$| $$ | $$ | $$| $$|  $$$$$$$| $$     |  \
   $$$$$$$| $$ | $$ | $$\n\
  \ |______/  |_______/|__/ |__/ |__/|__/ |____  $$|__/      \
   |_______/|__/ |__/ |__/\n\
  \                                       /$$  | \
   $$                                 \n\
  \                                      |  \
   $$$$$$/                                 \n\
  \                                       |______/       \n\
  \  \n\
  \   source: \
   https://patorjk.com/software/taag/#p=display&f=Acrobatic&t=Camlgram \n\
  \                                                                                      \n\
  \  "

let ny_text1 =
  "You are now using the New Years theme!\n\
  \  _    _                           _   _                 __    \
   __             \n\
  \  | |  | |                         | | | |               | |   | \
   |             \n\
  \  | |__| | __ _ _ __  _ __  _   _  |  || | _____      __  | |_| \
   |__  __ _ _ __ \n\
  \  |  __  |/ _` | '_ || '_ || | | | | . ` |/ _ | | __ / /   |   / _ \
   |/ _` | '__|\n\
  \  | |  | | (_| | |_) | |_) | |_| | | ||  |  __/| V  V /     | |  \
   __/ (_| | |   \n\
  \  |_|  |_||__,_| .__/| .__/ |__, | |_| |_||___| |_||_/      \
   |_||___||__,_|_|   \n\
  \               | |   | |     __/ \
   |                                             \n\
  \               |_|   |_|    \
   |___/                                              \n\
  \  source: \
   https://patorjk.com/software/taag/#p=display&f=Big&t=Happy%20New%20Year\n"

let ny_text2 =
  " \n\
  \                      . : .\n\
  \      __________    '.  :  .'\n\
  \     |         ||__.__'.:.'  .\n\
   jgs  |_________||  .  .':'.  .\n\
  \                    .'  :  '.\n\
  \                      ' : ' \n\
  \    source: https://www.asciiart.eu/holiday-and-events/fireworks\n"

let vday_text1 =
  "Welcome to the Valentine's Day Theme!\n\
   ,d88b.d88b,     ,d88b.d88b,     ,d88b.d88b,     ,d88b.d88b,     \
   ,d88b.d88b,\n\
   88888888888     88888888888     88888888888     88888888888     \
   88888888888\n\
   `Y8888888Y'     `Y8888888Y'     `Y8888888Y'     `Y8888888Y'     \
   `Y8888888Y'\n\
  \  `Y888Y'         `Y888Y'         `Y888Y'         `Y888Y'         \
   `Y888Y'\n\
  \    `Y'             `Y'             `Y'             `Y'             \
   `Y' \n\
  \  source: https://www.asciiart.eu/holiday-and-events/valentine\n"

let hallo_text1 =
  "Welcome to the spooky Halloween Theme!\n\
  \ __   __  _______  _______  _______  __   __    __   __  _______  \
   ___      ___      _______  _     _  _______  _______  __    _ \n\
   |  | |  ||   _   ||       ||       ||  | |  |  |  | |  ||   _   \
   ||   |    |   |    |       || | _ | ||       ||       ||  |  | |\n\
   |  |_|  ||  |_|  ||    _  ||    _  ||  |_|  |  |  |_|  ||  |_|  \
   ||   |    |   |    |   _   || || || ||    ___||    ___||   |_| |\n\
   |       ||       ||   |_| ||   |_| ||       |  |       ||       \
   ||   |    |   |    |  | |  ||       ||   |___ |   |___ |       |\n\
   |       ||       ||    ___||    ___||_     _|  |       ||       \
   ||   |___ |   |___ |  |_|  ||       ||    ___||    ___||  _    |\n\
   |   _   ||   _   ||   |    |   |      |   |    |   _   ||   _   \
   ||       ||       ||       ||   _   ||   |___ |   |___ | | |   |\n\
   |__| |__||__| |__||___|    |___|      |___|    |__| |__||__| \
   |__||_______||_______||_______||__| |__||_______||_______||_|  |__|\n\
   source: \
   https://patorjk.com/software/taag/#p=display&f=Star%20Wars&t=Happy%20Halloween\n"

let hallo_text2 =
  "    .#'\n\
  \                    ##\n\
  \                    h##\n\
  \                    `###\n\
  \                    .'###\n\
  \               .,88888888888888.\n\
  \          ..888888888888888888888888.\n\
  \      ..8888888888888888888888888888888.\n\
  \     88888     ,88888888      ,88888888888,\n\
  \     888888 + ,8888888888  * ,8888888888888,\n\
  \   .88888888,,888888888888  ,88888888`888888,\n\
  \  .88@888888@@888`'88888888,8888888888 `88888,\n\
  \ .88@@8888888888   `8888888@88888888888  `8888,\n\
   .88@@@888888888      88888888888888888   `8888,\n\
   888@@888888888 _     _`8888888888888888  ,888888\n\
   8888@8888888888888888888888888888888888 ,888888\n\
   `88888888`8888 `88 8'`88'8 8888'88888;888888888'\n\
  \ `8888888, `8 .  88 `  8 .` . ` 8  88888888888'\n\
  \  `88888888.` 8 . 8 .  ` 8  88  ` ,8888888888'\n\
  \   `888888888'8 888 8   888 888 ,88888888888'\n\
  \    `88888888888888888;:888888888888888888'\n\
  \      `8,888888888888888888888888888888/' \n\
  \      \n\
  \      source: -Ivica Podnar- \
   https://www.asciiart.eu/holiday-and-events/halloween\n"

let thank_text1 =
  "Welcome to the theme for Thanksgiving!!\n\
  \   __ __   ____  ____  ____  __ __      ______  __ __   ____  \
   ____   __  _  _____  ____  ____  __ __  ____  ____    ____ \n\
  \  |  |  | /    ||    ||    ||  |  |    |      ||  |  | /    ||    | \
   |  |/ ]/ ___/ /    ||    ||  |  ||    ||    |  /    |\n\
  \  |  |  ||  o  ||  o  )  o  )  |  |    |      ||  |  ||  o  ||  _  \
   ||  ' /(   |_ |   __| |  | |  |  | |  | |  _  ||   __|\n\
  \  |  _  ||     ||   _/|   _/|  ~  |    |_|  |_||  _  ||     ||  |  \
   ||    | |__  ||  |  | |  | |  |  | |  | |  |  ||  |  |\n\
  \  |  |  ||  _  ||  |  |  |  |___, |      |  |  |  |  ||  _  ||  |  \
   ||     |/  | ||  |_ | |  | |  :  | |  | |  |  ||  |_ |\n\
  \  |  |  ||  |  ||  |  |  |  |     |      |  |  |  |  ||  |  ||  |  \
   ||  .  ||    ||     | |  |  |   |  |  | |  |  ||     |\n\
  \  |__|__||__|__||__|  |__|  |____/       |__|  \
   |__|__||__|__||__|__||__||_| |___||___,_||____|  |_|  \
   |____||__|__||___,_|\n\
  \  source: \
   https://patorjk.com/software/taag/#p=display&f=Crawford2&t=Happy%20Thanksgiving\n\n\
  \  "

let xmas_text1 =
  "Have a holly jolly Christmas with this Christmas theme!\n\
   .-.   .-..----..----. .----..-.  .-.    .---. .-. .-..----. .-. \
   .----..---. .-.   .-.  .--.   .----.\n\
   |  `.'  || {_  | {}  }| {}  }| || |    /  ___}| {_} || {}  }| |{ \
   {__ {_   _}|  `.'  | | {} | { {__  \n\
   | || || || {__ | .-. || .-. | }  {     |     }| { } || .-. || \
   |.-._} } | |  | ||  | ||  ||  |.-._} }\n\
   `-' ` `-'`----'`-' `-'`-' `-' `--'      `---' `-' `-'`-' \
   `-'`-'`----'  `-'  `-' ` `-'`-'  `-'`----' \n\
   source: \
   https://patorjk.com/software/taag/#p=display&f=JS%20Bracket%20Letters&t=Merry%20Christmas\n\n\
  \  "

let xmas_text2 =
  "\n\
  \  .      *    *           *.       *   .                      *     .\n\
  \               .   .                   __   *    .     * .     *\n\
  \    *       *         *   .     .    _|__|_        *    __   \
   .       *\n\
  \  .  *  ||       {}          *        ('')    *       _|__|_     .\n\
  \       |  |   * {  }  *          .  <( . )> *  .       ('')   *   *\n\
  \  *    |  |     {  }   .   *       _(__.__)_  _   ,--<(  . )>  .    .\n\
  \      |    |   {    }          *   |       |  )),`   (   .  )     *\n\
  \   *   `||` ..  `||`   . *.   ... ==========='`   ... '--`-` ... * \
   jb .\n\
  \   source: \
   https://www.asciiart.eu/holiday-and-events/christmas/snowmen \n\n\
  \  "

let summer_text1 =
  "Welcome to the theme for Summer!!\n\
  \                                                          \n\
  \                ██        ██░░▓▓                    \n\
  \              ▓▓░░▓▓▓▓▓▓▓▓░░░░░░▓▓                  \n\
  \              ██░░░░▒▒░░▒▒░░░░░░▒▒████████          \n\
  \            ██░░░░░░░░░░░░░░░░░░░░░░░░░░██          \n\
  \    ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░██          \n\
  \      ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██        \n\
  \      ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████    \n\
  \      ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██  \n\
  \    ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██    \n\
  \  ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██    \n\
   ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██    \n\
  \  ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██    \n\
  \  ▒▒░░░░░░░░░░░░████░░░░░░░░░░░░████░░░░░░░░░░██    \n\
  \    ██░░░░░░░░██░░░░██░░░░░░░░██░░░░██░░░░░░░░░░██  \n\
  \    ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██\n\
  \  ██░░░░░░░░▒▒▒▒░░░░░░██░░░░██░░░░░░▒▒▒▒░░░░░░████  \n\
   ▓▓░░░░░░░░░░▒▒▒▒░░░░░░░░▓▓▓▓░░░░░░░░▒▒▒▒░░░░██      \n\
   ░░██░░░░░░░░░░░░░░░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░██      \n\
  \      ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      \n\
  \        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      \n\
  \        ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████      \n\
  \        ████████░░░░░░░░░░░░░░░░░░░░██              \n\
  \        ██      ██░░░░░░░░██████░░██                \n\
  \                  ██░░████      ████                \n\
  \                    ██            ██                \n\
  \    "

let bday_text1 =
  "Welcome to the theme for your Birthday!!\n\
  \      ____▄▀▀▀▄▄▄▄▄▄▄▀▀▀▄\n\
  \      ────█▒▒░░░░░░░░░▒▒█\n\
  \       ────█░░█░░░░░█░░█\n\
  \       ─▄▄──█░░░▀█▀░░░█──▄▄\n\
  \       █░░▀─▀▄░░░░░░░▄▀─▀░░█\n\
  \    "

let bday_text2 =
  "    █▄█ █▀█ █▀█ █▀█ █▄█\n\
  \  █▀█ █▀█ █▀▀ █▀▀ ░█\n\
  \  ♥ 🅱🅸🆁🆃🅷🅳🅰🆈 ♥\n\
  \  source: https://texteditor.com/messages/\n"

let add_contact_text =
  "\n\
  \ Enter the username of who you want to add to your contacts. \n\
  \    If you want to add more than one person separate them by ';' \
   (for e.g. A;B;C). \n\
  \    To go back to the menu, type #back. \n\
   >>\n"

let change_user_text =
  "\n\
   You can now change your username! \n\
  \  \n\
   Type #back at anytime to exit and go back to the menu. \n\
  \  \n\
   Type in your new username:\n\
   >>\n"

let change_pass_text =
  "\n\
   You can now change your password! \n\
  \  \n\
   Type #back to exit and access the menu at anytime.\n\
  \  \n\
   Are you sure you want to change your password? Select Y/N\n\
   >>\n"

let user_exists_text =
  "\n\
   This username is already exists. Please enter a different username.\n\
   >>\n"

let user_not_found_text =
  "\nYour username was not found. Please try again.\n"

let incorr_pass_text =
  "\nYour password is incorrect. Please try again.\n"

let invalid_entry_text = "\nInvalid entry. Please try again.\n"

let color1 = ref "cyan"

let color2 = ref "red"

(** [choosecolor] is the [color] that the user inputs *)
let choosecolor color =
  match color with
  | "red" -> ANSITerminal.red
  | "blue" -> ANSITerminal.blue
  | "cyan" -> ANSITerminal.cyan
  | "green" -> ANSITerminal.green
  | "magenta" -> ANSITerminal.magenta
  | "white" -> ANSITerminal.white
  | "black" -> ANSITerminal.black
  | "yellow" -> ANSITerminal.yellow
  | _ -> ANSITerminal.white

(** [print_color] is the [text] printed in the specified [color] *)
let print_color text color =
  ANSITerminal.print_string [ choosecolor color ] text

(** Checks if [input] is #quit and exits the program accordingly *)
let parse_input input () =
  match input with
  | "#quit" -> Stdlib.exit 0
  | _ -> ()

(** [color_options ()] is the list of color options that a user can type
    in *)
let color_options () =
  print_string "\n";
  print_color "red\n" "red";
  print_color "blue\n" "blue";
  print_color "cyan\n" "cyan";
  print_color "green\n" "green";
  print_color "magenta\n" "magenta";
  print_color "white\n" "white";
  print_color "yellow\n" "yellow";
  print_color "black\n" "black"

(** [print_handle item] is a string representation of the user's
    selected command. *)
let print_handle item =
  print_color ("You have selected: " ^ item ^ "\n") "cyan"

(** [ny_intro ()] is the set of commands to be printed when the theme is
    change to New Year*)
let ny_intro () =
  print_color ny_text1 !color1;
  print_color ny_text2 !color2

(** [vday_intro ()] is the set of commands to be printed when the theme
    is change to Valentine's Day*)
let vday_intro () = print_color vday_text1 !color1

(** [halloween_intro ()] is the set of commands to be printed when the
    theme is change to Halloween*)
let halloween_intro () =
  print_color hallo_text1 !color1;
  print_color hallo_text2 !color2

(** [thanksgiving_intro ()] is the set of commands to be printed when
    the theme is change to Thanksgiving*)
let thanksgiving_intro () = print_color thank_text1 !color1

(** [christmas_intro ()] is the set of commands to be printed when the
    theme is change to Christmas*)
let christmas_intro () =
  print_color xmas_text1 !color1;
  print_color xmas_text2 !color2

(** [summer_intro ()] is the set of commands to be printed when the
    theme is change to Summer*)
let summer_intro () = print_color summer_text1 !color1

(** [bday_intro ()] is the set of commands to be printed when the theme
    is change to Birthday*)
let bday_intro () =
  print_color bday_text1 !color1;
  print_color bday_text2 !color2

(** [get_contact_print lst] prints the list of contacts in the color
    cyan*)
let rec get_contact_print = function
  | [] -> ""
  | h :: t ->
      print_color h "cyan";
      get_contact_print t

(** [create_chat_help user users] handles the menu item #chat and allows
    users to chat with others*)
and create_chat_help (user : Client.user_info) (users : State.users) ()
    =
  print_color "\nHere are the list of people you may chat with:\n>>\n"
    !color1;
  let contacts_list =
    State.get_contacts users (Client.get_username user)
  in
  let () = print_string contacts_list in
  print_color "\nWho do you want to talk to?\n>>\n" !color1;
  let name = read_line () in
  if name = "#quit" then Stdlib.exit 0
  else if name = "#logout" then welcome_screen users ()
  else if name = "#menu" then handle_menu users user ()
  else open_client_window user users name

(** [open_client_window user users name] connects to the server and
    opens the chat window for the client *)
and open_client_window user users name =
  try
    let contact_info = State.get_user_info name users in
    if
      State.check_existing_user name
        (Client.get_password contact_info)
        users
    then
      let _ = Client.add_contacts user contact_info in
      let _ = Sys.command "python3 src/client.py" in
      print_color "You have closed this chat" !color2
  with
  | State.UserNotFound ->
      print_color "This user does not exist, try again!" !color2;
      create_chat_help user users ()

(** [add_contact_menu user users ()] adds the given user to the contact
    list of the [user]. *)
and add_contact_menu (user : Client.user_info) (users : State.users) ()
    =
  print_color add_contact_text !color1;
  let new_contact = read_line () in
  let list_contacts = String.split_on_char ';' new_contact in
  if new_contact = "#back" then handle_menu users user ()
  else if new_contact = "#quit" then Stdlib.exit 0
  else
    try
      let add_contact contact =
        Client.add_contacts user (State.get_user_info contact users)
      in
      List.iter add_contact list_contacts
    with
    | State.UserNotFound ->
        print_color "This user does not exist, try again!" !color2;
        add_contact_menu user users ()

(** [handle_menu users user_info ()] is the response to the user's
    selected command *)
and handle_menu (users : State.users) (user_info : Client.user_info) ()
    =
  print_color menu !color1;
  match read_line () with
  | x -> (
      match x with
      | "#chat" -> handle_chat users user_info ()
      | "#addcontact" -> handle_add_contact users user_info ()
      | "#color" -> handle_color users user_info ()
      | "#quit" -> Stdlib.exit 0
      | "#logout" -> welcome_screen users ()
      | "#menu" -> handle_menu users user_info ()
      | "#updateuser" -> handle_update_username users user_info ()
      | "#updatepass" -> handle_update_password users user_info ()
      | "#themes" -> handle_themes_menu users user_info ()
      | "#games" -> handle_games_menu users user_info ()
      | "#calendar" -> handle_calendar users user_info ()
      | _ ->
          print_color invalid_entry_text !color2;
          handle_menu users user_info ())

(** [handle_chat users user_info ()] calls the function that allows the
    user to chat and then calls the menu *)
and handle_chat users user_info () =
  create_chat user_info users ();
  handle_menu users user_info ()

(** [handle_add_contact users user_info ()] calls the function that
    allows the user to add contact and then calls the menu *)
and handle_add_contact users user_info () =
  add_contact_menu user_info users ();
  handle_menu users user_info ()

(** [handle_color users user_info ()] displays the menu with all
    possible colors and then calls the menu *)
and handle_color users user_info () =
  color_options ();
  handle_menu users user_info ()

(** [handle_calendar users user_info ()] calls the function that allows
    the user to see the calendar and then calls the menu *)
and handle_calendar users user_info () =
  Calendar.start_page ();
  handle_menu users user_info ()

(** [handle_games_menu users user_info ()] is the response to start the
    game according to the user's selected command *)
and handle_games_menu
    (users : State.users)
    (user_info : Client.user_info)
    () =
  print_color games_menu !color1;
  match read_line () with
  | x -> (
      match x with
      | "#tictactoe" ->
          Tictactoe.start_game ();
          handle_menu users user_info ()
      | "#chopsticks" ->
          Chopsticks.start_game ();
          handle_menu users user_info ()
      | "#wordscramble" ->
          Scramble.start_game ();
          handle_menu users user_info ()
      | "#hangman" ->
          Hangman.start_game ();
          handle_menu users user_info ()
      | "#blackjack" ->
          Blackjack.start_game ();
          handle_menu users user_info ()
      | "#menu" -> handle_menu users user_info ()
      | "#quit" -> Stdlib.exit 0
      | _ ->
          print_color invalid_entry_text !color2;
          handle_games_menu users user_info ())

(** [handle_themes_menu users user_info ()] is the response to change
    the theme according to the user's selected command *)
and handle_themes_menu
    (users : State.users)
    (user_info : Client.user_info)
    () =
  print_color themes_menu !color1;
  match read_line () with
  | x -> (
      match x with
      | "#newyear" -> ny_theme users user_info ()
      | "#vday" -> vday_theme users user_info ()
      | "#halloween" -> halloween_theme users user_info ()
      | "#thanksgiving" -> thanksgiving_theme users user_info ()
      | "#christmas" -> xmas_theme users user_info ()
      | "#summer" -> summer_theme users user_info ()
      | "#bday" -> bday_theme users user_info ()
      | "#original" -> original_theme users user_info ()
      | "#themesmenu" -> handle_themes_menu users user_info ()
      | "#menu" -> handle_menu users user_info ()
      | _ ->
          print_color invalid_entry_text !color2;
          handle_themes_menu users user_info ())

(** [ny_theme users user_info ()] changes the theme to New Years *)
and ny_theme users user_info () =
  color1 := "yellow";
  color2 := "magenta";
  ny_intro ();
  handle_menu users user_info ()

(** [vday_theme users user_info ()] changes the theme to Valentines Day *)
and vday_theme users user_info () =
  color1 := "magenta";
  color2 := "red";
  vday_intro ();
  handle_menu users user_info ()

(** [halloween_theme users user_info ()] changes the theme to Halloween *)
and halloween_theme users user_info () =
  color1 := "yellow";
  color2 := "white";
  halloween_intro ();
  handle_menu users user_info ()

(** [thanksgiving_theme users user_info ()] changes the theme to
    Thanksgiving *)
and thanksgiving_theme users user_info () =
  color1 := "red";
  color2 := "yellow";
  thanksgiving_intro ();
  handle_menu users user_info ()

(** [xmas_theme users user_info ()] changes the theme to Christmas *)
and xmas_theme users user_info () =
  color1 := "green";
  color2 := "red";
  christmas_intro ();
  handle_menu users user_info ()

(** [summer_theme users user_info ()] changes the theme to Summer *)
and summer_theme users user_info () =
  color1 := "yellow";
  color2 := "orange";
  summer_intro ();
  handle_menu users user_info ()

(** [bday_theme users user_info ()] changes the theme to Birthday *)
and bday_theme users user_info () =
  color1 := "magenta";
  color2 := "cyan";
  bday_intro ();
  handle_menu users user_info ()

(** [original_theme users user_info ()] changes the theme back to the
    original one *)
and original_theme users user_info () =
  color1 := "cyan";
  color2 := "red";
  print_color "You are now back to using the original theme" !color1;
  handle_menu users user_info ()

(** [create_account users ()] prompts the user to create an account *)
and create_account (users : State.users) () =
  print_color "\nPlease create a username\n>>\n" !color1;
  let input_username = read_line () in
  parse_input input_username ();
  match State.taken_username input_username users with
  | true ->
      print_color user_exists_text !color2;
      create_account users ()
  | false ->
      print_color "\nPlease create a password\n>>\n" !color1;
      let input_password = read_line () in
      parse_input input_password ();
      let updated_users =
        State.add_new_user input_username input_password users
      in
      handle_menu updated_users
        (State.get_user_info input_username updated_users)

(* and add_to_csv user pass users = State.add_new_user user pass
   users *)

(** [user_login users ()] prompts the user to log in to their account
    and checks that they have entered valid credentials *)
and user_login (users : State.users) () =
  print_color "\nWhat is your username?\n>>\n" !color1;
  let input_username = read_line () in
  parse_input input_username ();
  match State.taken_username input_username users with
  | false ->
      print_color user_not_found_text !color2;
      login users ()
  | true -> (
      print_color "\nWhat is your password?\n>>\n" !color1;
      let input_password = read_line () in
      parse_input input_password ();
      match
        State.check_existing_user input_username input_password users
      with
      | true ->
          let user_info = State.get_user_info input_username users in
          handle_menu users user_info ()
      | false ->
          print_color incorr_pass_text !color2;
          user_login users ())

(** [login users ()] either creates a new user or allows an existing
    user to log in based on their status in the application *)
and login (users : State.users) () : unit =
  print_color
    "\n\
     Would you like to create an account? If you have an existing \
     account, select N. Y/N\n\
     >>\n"
    !color1;
  match read_line () with
  | "Y"
  | "y" ->
      create_account users () ()
  | "N"
  | "n" ->
      user_login users ()
  | "#quit" -> Stdlib.exit 0
  | _ ->
      print_color invalid_entry_text !color2;
      login users ()

(** [create_chat user] opens a chat with the contact chosen by the
    [user] *)
and create_chat user users () = create_chat_help user users ()

(** [handle_update] allows user to change password or username*)
and handle_update_username
    (users : State.users)
    (user : Client.user_info)
    () =
  print_color change_user_text !color1;
  match read_line () with
  | "" ->
      print_color invalid_entry_text !color2;
      handle_update_username users user ()
  | "#back" -> handle_menu users user ()
  | x ->
      if State.taken_username x users = true then (
        print_color "This username is taken. Try again." !color2;
        handle_update_username users user ())
      else
        let old_username = Client.get_username user in
        let _ = Client.change_username user x in
        let new_users =
          State.update_users_username users old_username x
        in
        let string_user = "Changed username to: " ^ x ^ "\n" in
        print_color string_user !color1;
        handle_menu new_users user ()

(** [handle_update_password users user] allows the user to change their
    password *)
and handle_update_password
    (users : State.users)
    (user : Client.user_info)
    () =
  print_color change_pass_text !color1;
  match read_line () with
  | "Y"
  | "y" -> begin
      print_color "\nType in your new password:\n>>\n" !color1;
      match read_line () with
      | "" ->
          print_color
            "\nInvalid entry. Please enter your new password.\n" !color2;
          handle_update_password users user ()
      | "#back" -> handle_menu users user ()
      | x -> handle_change_pass user users x ()
    end
  | "N"
  | "n" ->
      handle_menu users user ()
  | "#back" -> handle_menu users user ()
  | "#quit" -> Stdlib.exit 0
  | _ ->
      print_color invalid_entry_text !color2;
      handle_update_password users user ()

(** [handle_change_pass user users pass ()] handles the cases when the
    user enters a valid entry [pass] and changes the password to [pass] *)
and handle_change_pass user users pass () =
  let _ = Client.change_password user pass in
  let username = Client.get_username user in
  let new_users = State.update_users_password users username pass in
  print_color "\nChanged password." !color1;
  handle_menu new_users user ()

(** [welcome_screen users] is the welcome screen that appears when the
    user first opens the application *)
and welcome_screen (users : State.users) () =
  print_color beginning_str "cyan";
  print_color
    "\n\
     Camlgram is an instant messaging system where you can talk to \
     your friends!"
    "yellow";
  print_color
    "\n\
     You may type #quit if you want to exit at any time, but we'll be \
     sad to see you leave! \n"
    "yellow";
  login users ()

(** [csv_to_users csv_info] is the users list corresponding to
    [csv_info] *)
let rec csv_to_users (csv_info : Csv.t) =
  match csv_info with
  | [] -> State.init
  | h :: t -> (
      match h with
      | [] -> State.init
      | h' :: h'' :: _ -> State.add_init_user h' h'' (csv_to_users t)
      | _ -> State.init)

let start () =
  let users_csv_list = Csv.load "src/data.csv" in
  let users = csv_to_users users_csv_list in
  welcome_screen users ()
