type bday = {
  mutable month : int;
  mutable day : int;
  mutable year : int;
}

let celebrate =
  "\n\n\
   ღ♪*•.¸¸.•*¨¨*•.¸.•*¨¨*•.¸¸.•*•♪ღ♪\n\
   ღ♪░H░A░P░P░Y░ B░I░R░T░H░D░A░Y░♪ღ\n\
   •♪ღ♪*•.¸¸.•*¨¨*••*¨¨*•.¸¸.•*•♪ღ♪\n\n\
   source: \
   https://textpaint.net/?t=ღ♪*•.¸¸.•*¨¨*•.¸.•*¨¨*•.¸¸.•*•♪ღ♪%0Aღ♪░H░A░P░P░Y░_B░I░R░T░H░D░A░Y░♪ღ%0A•♪ღ♪*•.¸¸.•*¨¨*••*¨¨*•.¸¸.•*•♪ღ♪\n\n"

let celebrate_friend n =
  "\n\n\
  \       , , , , , ,\n\
  \       |_|_|_|_|_|\n\
  \      |~=,=,=,=,=~|         Go Wish " ^ n
  ^ " a Happy Birthday!\n\
    \      |~~~~~~~~~~~|\n\
    \    |~=,=,=,=,=,=,=~|\n\
    \    |~~~~~~~~~~~~~~~|\n\
    \  |~=,=,=,=,=,=,=,=,=~|\n\
    \  |~~~~~~~~~~~~~~~~~~~|\n\
     (^^^^^^^^^^^^^^^^^^^^^^^)\n\
    \ `'-------------------'`    \n\n\
     source: https://www.asciiart.eu/holiday-and-events/birthdays\n\n"

let init = { month = 0; day = 0; year = 0 }

let user_bday = { month = 0; day = 0; year = 0 }

type friends = (string * bday) list

let friends_bdays = ref []

let to_year y = "20" ^ String.sub (string_of_int y) 1 2 |> int_of_string

let compare d1 d2 =
  if d1.month = d2.month && d1.day = d2.day then true else false

let date_curr =
  let date = Unix.localtime (Unix.gettimeofday ()) in
  {
    month = date.tm_mon + 1;
    day = date.tm_mday;
    year = to_year date.tm_year;
  }

let bday_to_str b =
  string_of_int b.month ^ "/" ^ string_of_int b.day ^ "/"
  ^ string_of_int b.year

let get_time =
  let time = Unix.localtime (Unix.gettimeofday ()) in
  string_of_int time.tm_hour
  ^ ":"
  ^ string_of_int time.tm_min
  ^ ":"
  ^ string_of_int time.tm_sec

let get_date =
  let time = Unix.localtime (Unix.gettimeofday ()) in
  string_of_int (time.tm_mon + 1) ^ "/" ^ string_of_int time.tm_mday

let banner =
  "\n\n\
  \  ▄▄▄▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄     ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄  ▄▄▄▄▄▄ ▄▄▄▄▄▄   \n\
  \  █       █      █   █   █       █  █  █ █      ██      █   ▄  █  \n\
  \  █       █  ▄   █   █   █    ▄▄▄█   █▄█ █  ▄    █  ▄   █  █ █ █  \n\
  \  █     ▄▄█ █▄█  █   █   █   █▄▄▄█       █ █ █   █ █▄█  █   █▄▄█▄ \n\
  \  █    █  █      █   █▄▄▄█    ▄▄▄█  ▄    █ █▄█   █      █    ▄▄  █\n\
  \  █    █▄▄█  ▄   █       █   █▄▄▄█ █ █   █       █  ▄   █   █  █ █\n\
  \  █▄▄▄▄▄▄▄█▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄█  █▄▄█▄▄▄▄▄▄██▄█ █▄▄█▄▄▄█  █▄█\n\
  \  \n\
  \ source: https://texteditor.com/ascii-art/ \n\n"

let menu =
  "\n\n\
   ╔═════════════════════════════════╗\n\
  \             M E N U \n\
   ▫️ Set your birthday : #setbday\n\
   ▫️ Add friends' birthdays : #bdays\n\
   ▫️ Calendar viewing mode : #view\n\
   ▫️ Back to main menu : #back\n\
   ╚═════════════════════════════════╝\n"

let december =
  "\n\n\
   ╔════════════════════╗\n\
   ║ December ░░░░ 2021 ║\n\
   ╟──┬──┬──┬──┬──┬──┬──╢\n\
   ║░░│░░│░░│01│02│03│04║\n\
   ╟──┼──┼──┼──┼──┼──┼──╢\n\
   ║05│06│07│08│09│10│11║\n\
   ╟──┼──┼──┼──┼──┼──┼──╢\n\
   ║12│13│14│15│16│17│18║\n\
   ╟──┼──┼──┼──┼──┼──┼──╢\n\
   ║19│20│21│22│23│24│25║\n\
   ╟──┼──┼──┼──┼──┼──┼──╢\n\
   ║26│27│28│29│30│31│░░║\n\
   ╚══╧══╧══╧══╧══╧══╧══╝\n\n\
  \ source: https://qwerty.dev/calendar-generator/ \n\n"

let view_menu =
  "\n\
   ╔═════════════════════════════════╗\n\
  \             V I E W \n\
   ▫️ Your birthday: #mybday\n\
   ▫️ Friends' birthdays : #bdays\n\
   ▫️ Back to calendar : #back\n\
   ╚═════════════════════════════════╝\n\n"

let in_page = ref true

(** [handle_menu ()] handles the different menu options *)
let rec handle_menu () =
  print_string menu;
  match read_line () with
  | "#quit" -> Stdlib.exit 0
  | "#setbday" -> set_bday ()
  | "#bdays" -> bdays ()
  | "#view" -> view ()
  | "#back" -> print_string "Closing calendar...\n\n"
  | _ ->
      print_string "Invalid Response. Try again. \n";
      handle_menu ()

(** [create_bday m d y ()] set the fields of the user's birthday *)
and create_bday m d y =
  user_bday.month <- int_of_string m;
  user_bday.day <- int_of_string d;
  user_bday.year <- int_of_string y

(** [name_bday n m d y  ()] creates a pair with a name and a birthday *)
and name_bday n m d y =
  ( n,
    {
      month = int_of_string m;
      day = int_of_string d;
      year = int_of_string y;
    } )

(** [make_bday m d y ()] creates a birthday with a given month, day, and
    year *)
and make_bday m d y =
  {
    month = int_of_string m;
    day = int_of_string d;
    year = int_of_string y;
  }

(** [to_date s] takes user input and sets the user's birthday *)
and to_date s =
  let lst = String.split_on_char '/' s in
  if List.length lst != 3 then (
    print_string "Invalid birthday. Try again. \n";
    set_bday ())
  else create_bday (List.nth lst 0) (List.nth lst 1) (List.nth lst 2);
  print_string
    ("Your birthday has been set to " ^ bday_to_str user_bday ^ ".");
  if compare user_bday date_curr = true then print_string celebrate;
  handle_menu ()

(** [update_bdays d ()] updates the list of friends' birthdays *)
and update_bdays d () = friends_bdays := !friends_bdays @ [ d ]

(** [other_date s n] takes user input and sets friends' birthdays *)
and other_date s n =
  let lst = String.split_on_char '/' s in
  if List.length lst != 3 then (
    print_string "Invalid birthday. Try again. \n";
    bdays ())
  else
    let date =
      make_bday (List.nth lst 0) (List.nth lst 1) (List.nth lst 2)
    in
    update_bdays
      (name_bday n (List.nth lst 0) (List.nth lst 1) (List.nth lst 2))
      ();
    print_string
      (n ^ "'s birthday has been set to "
      ^ bday_to_str (List.assoc n !friends_bdays)
      ^ ".");
    if compare date date_curr = true then
      print_string (celebrate_friend n);
    handle_menu ()

(** [set_bday ()] gets data for user's birthday *)
and set_bday () =
  print_string "Let's add your birthday!\n";
  print_string "Please enter your birthday in the form of MM/DD/YYYY\n";
  print_string ">>";
  let date = read_line () in
  to_date date

(** [set_bday ()] gets data for friend's birthday *)
and bdays () =
  print_string "Let's add your friend's birthday!\n";
  print_string "Please enter their name\n";
  print_string ">>";
  let name = read_line () in
  print_string "Please enter your birthday in the form of MM/DD/YYYY\n";
  print_string ">>";
  let date = read_line () in
  other_date date name

(** [view ()] handles the menu for viewing dates *)
and view () =
  print_string "👁  VIEWING MODE 👁 \n";
  print_string (december ^ "\n\n");
  print_string view_menu;
  match read_line () with
  | "#mybday" ->
      if user_bday = init then (
        print_string
          "You haven't entered your birthday yet. Go to menu to add it \
           in.";
        view ())
      else print_string ("🎉 Your birthday is " ^ bday_to_str user_bday);
      view ();
      if compare user_bday date_curr = true then print_string celebrate
  | "#back" -> handle_menu ()
  | "#bdays" -> view_bdays ()
  | _ -> print_string "Invalid response. Try Again. \n"

(** [view_bdays ()] prints out friends' birthdays *)
and view_bdays () =
  if !friends_bdays = [] then (
    print_string
      "You haven't entered any birthdays. Go to menu to do so.\n\n";
    view ())
  else
    let names = fst (List.split !friends_bdays) in
    let bdays = snd (List.split !friends_bdays) in
    let bdays_str = List.map bday_to_str bdays in
    print_string "\nFRIENDS 👯‍♀️\n";
    List.iter (Printf.printf "~%s\n") names;
    print_string "\n BIRTHDAYS 🎂\n";
    List.iter (Printf.printf "~%s\n") bdays_str;
    print_string "\n\n\n";
    view ()

(** [start_game ()] starts the page for the user *)
and start_page () =
  print_string banner;
  print_string
    "\n\
     This is where you get all of your dates, times, and keep track of \
     important events. To go back to the main menu, type #menu. If you \
     want to exit Camlgram, type #quit.\n\n";
  print_string "\n* * * * * * * * * * * * *\n          TODAY    \n ";
  print_string ("       Date: " ^ get_date);
  print_string ("\n       Time: " ^ get_time);

  print_string "\n* * * * * * * * * * * * * ";
  handle_menu ()
