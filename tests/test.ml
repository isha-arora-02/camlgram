open OUnit2
open Chat
open State
open Client
open Blackjack
open Calendar

(*****************************************************************)
(* To test our program, we did test cases for the functions in app.ml,
   state.ml and some of the minigames. Some files could not be tested
   throughout the OUnit Testing Suite, such as the server in client.py,
   since it requires user's input. Some of the minigames, such as tic
   tac toe are also not included in this test suite as users play
   against the computer, so there are randomized algorithms in the
   programs in which we cannot test through OUnit testing. For these
   files that could not be tested through this testing suite, we have
   tested manually to ensure that they run properly and have the desired
   output, to fully cover the correctness of the system. *)
(*****************************************************************)

let user_1 = create_user "meera" "mr828"

let user_2 = create_user "maggie" "mw695"

let user_3 = add_contacts user_1 user_2

(*meera with new contact maggie*)
let user_list = State.init

let user_list_1 = add_new_user "meera" "mr828" State.init

let user_list_2 = add_new_user "maggie" "mw695" user_list_1

let contact_list = [ "maggie" ]

let user_4 = create_user "" ""

let user_4_wcontact1 = add_contacts user_4 user_1

let user_4_wcontact2 = add_contacts user_4 user_2

(** add_new_test name user pass users expected_output] constructs an
    OUnit test named [name] that asserts the quality of
    [expected_output] with [add_new_test name input room_id ]. *)
let add_new_test
    (name : string)
    (user : string)
    (pass : string)
    (users : users)
    (expected_output : users) : test =
  name >:: fun _ ->
  assert_equal expected_output (add_new_user user pass users)

(** check_user_test name user pass users expected_output] constructs an
    OUnit test named [name] that asserts the quality of
    [expected_output] with [check_user_test name user pass users ]. *)
let check_user_test
    (name : string)
    (user : string)
    (pass : string)
    (users : users)
    (expected_output : bool) : test =
  name >:: fun _ ->
  assert_equal expected_output (check_existing_user user pass users)

(** user_info_test name user users expected_output] constructs an OUnit
    test named [name] that asserts the quality of [expected_output] with
    [user_info_test name user users ]. *)
let user_info_test
    (name : string)
    (user : string)
    (users : users)
    (expected_output : user_info) : test =
  name >:: fun _ ->
  assert_equal expected_output (get_user_info user users)

(** taken_username_test name user users expected_output] constructs an
    OUnit test named [name] that asserts the quality of
    [expected_output] with [taken_username_test name user users ]. *)
let taken_username_test
    (name : string)
    (user : string)
    (users : users)
    (expected_output : bool) : test =
  name >:: fun _ ->
  assert_equal expected_output (taken_username user users)

(** [remove_user user (users : users) ] constructs an OUnit test named
    [name] that asserts the quality of [expected_output] with
    [taken_username_test name user users ]. *)
let remove_user_test
    (name : string)
    (user : string)
    (users : users)
    (expected_output : users) : test =
  name >:: fun _ ->
  assert_equal expected_output (remove_user user users)

(** get_username_test name user pass expected_output] constructs an
    OUnit test named [name] that asserts the quality of
    [expected_output] with [get_username_test name user pass]. *)
let get_username_test
    (name : string)
    (user : user_info)
    (expected_output : string) : test =
  name >:: fun _ -> assert_equal expected_output (get_username user)

(** get_password_test name user pass expected_output] constructs an
    OUnit test named [name] that asserts the quality of
    [expected_output] with [get_password_test name user pass]. *)
let get_password_test
    (name : string)
    (user : user_info)
    (expected_output : string) : test =
  name >:: fun _ -> assert_equal expected_output (get_password user)

(** get_contacts_test name user expected_output] constructs an OUnit
    test named [name] that asserts the quality of [expected_output] with
    [get_contacts_test name user pass]. *)
let get_contacts_test
    (name : string)
    (user : user_info)
    (expected_output : username list) : test =
  name >:: fun _ -> assert_equal expected_output (get_contacts user)

(** [num_users_test name users expected_output] constructs an OUnit test
    named [name] that asserts the quality of [expected_output] with
    [num_users_test name users]. *)
let num_users_test
    (name : string)
    (users : users)
    (expected_output : int) : test =
  name >:: fun _ ->
  assert_equal expected_output (num_users users) ~printer:string_of_int

(** [change_username_test name user new_username expected_output]
    constructs an OUnit test named [name] that asserts the quality of
    [expected_output] with
    [change_username_test name user new_username]. *)
let change_username_test
    (name : string)
    (user : user_info)
    (new_username : string)
    (expected_output : username) : test =
  name >:: fun _ ->
  assert_equal expected_output
    (get_username (change_username user new_username))

(** [change_password_test name user new_username expected_output]
    constructs an OUnit test named [name] that asserts the quality of
    [expected_output] with
    [change_password_test name user new_username]. *)
let change_password_test
    (name : string)
    (user : user_info)
    (new_pass : string)
    (expected_output : password) : test =
  name >:: fun _ ->
  assert_equal expected_output
    (get_password (change_password user new_pass))

(** [bjack_totalsum_test name hand expected_output] constructs an OUnit
    test named [name] that asserts the quality of [expected_output] with
    [total_sum hand acc]. *)
let bjack_totalsum_test
    (name : string)
    (hand : (suit * card_typ) option list)
    (expected_output : int) : test =
  name >:: fun _ -> assert_equal expected_output (total_sum hand 0)

(** [bjack_strcard_test name card expected_output] constructs an OUnit
    test named [name] that asserts the quality of [expected_output] with
    [str_of_card card]. *)
let bjack_strcard_test
    (name : string)
    (card : (suit * card_typ) option)
    (expected_output : string) : test =
  name >:: fun _ -> assert_equal expected_output (str_of_card card)

(** [compare_bday_test name d1 d2 expected_output] constructs an OUnit
    test named [name] that asserts the quality of [expected_output] with
    [compare d1 d2]. *)
let compare_bday_test
    (name : string)
    (d1 : bday)
    (d2 : bday)
    (expected_output : bool) : test =
  name >:: fun _ -> assert_equal expected_output (compare d1 d2)

(** [bday_to_str_test name date expected_output] constructs an OUnit
    test named [name] that asserts the quality of [expected_output] with
    [bday_to_str_test d1 d2]. *)
let bday_to_str_test
    (name : string)
    (date : bday)
    (expected_output : string) : test =
  name >:: fun _ -> assert_equal expected_output (bday_to_str date)

(** [name_bday_test name person month day year expected_output]
    constructs an OUnit test named [name] that asserts the quality of
    [expected_output] with [name_bday_test person month day year]. *)
let name_bday_test
    (name : string)
    (person : string)
    (month : string)
    (day : string)
    (year : string)
    (expected_output : string * bday) : test =
  name >:: fun _ ->
  assert_equal expected_output (name_bday person month day year)

let state_tests =
  [
    add_new_test "this is the test for adding user meera" "meera"
      "mr828" user_list user_list_1;
    ( "existing user" >:: fun _ ->
      assert_raises UserAlreadyExists (fun () ->
          add_new_user "meera" "mr828" user_list_1) );
    check_user_test "checking if meera is in user list" "meera" "mr828"
      user_list_1 true;
    check_user_test "checking meera in list but wrong password" "meera"
      "m828" user_list_1 false;
    ( "existing user" >:: fun _ ->
      assert_raises UserNotFound (fun () ->
          check_existing_user "maggie" "mw695" user_list_1) );
    (*user_info_test "getting meera's info" "meera" user_list_1 user_1
      ;*)
    ( "trying to find non-existing user" >:: fun _ ->
      assert_raises UserNotFound (fun () ->
          get_user_info "maggie" user_list_1) );
    taken_username_test "checking if meera exists in list" "meera"
      user_list_1 true;
    taken_username_test " checking if maggie exists in list" "maggie"
      user_list_1 false;
    num_users_test "checking list of 1 person" user_list_1 1;
    num_users_test "checking list of 2 people" user_list_2 2;
    remove_user_test "removing a user from a list of 1 person" "meera"
      user_list_1 user_list;
    remove_user_test "removing a user from a list of 2 people" "maggie"
      user_list_2 user_list_1;
  ]

let client_tests =
  [
    get_username_test "getting meera's username" user_1 "meera";
    get_username_test "getting maggie's username" user_2 "maggie";
    get_username_test "getting empty username" user_4 "";
    get_password_test "getting meera's password" user_1 "mr828";
    get_password_test "getting maggie's password" user_2 "mw695";
    get_password_test "getting empty password" user_4 "";
    get_contacts_test "getting meera's contacts" user_1 [ ""; "maggie" ];
    get_contacts_test "getting empty user's contacts" user_4
      [ "maggie"; "meera" ];
    change_username_test "changing meera's username" user_1 "meera1"
      "meera1";
    change_password_test "changing maggie's password" user_2 "mw555"
      "mw555";
    change_username_test "changing the empty user's username" user_4
      "new_user" "new_user";
    change_password_test "changing the new user's password" user_4
      "new_pass" "new_pass";
    change_username_test
      "changing the new user's password back to empty" user_4 "" "";
  ]

let hand1 : (suit * card_typ) option list = []

let hand2 = [ Some (Spades, Ace) ]

let hand3 = [ Some (Clubs, Number 1) ]

let hand4 = [ Some (Diamonds, Queen) ]

let hand5 = [ Some (Hearts, Jack) ]

let hand6 = [ Some (Spades, King) ]

let hand7 =
  [ Some (Clubs, Number 9); Some (Hearts, Jack); Some (Diamonds, Ace) ]

let hand8 =
  [ Some (Diamonds, Jack); Some (Diamonds, King); Some (Hearts, Ace) ]

let hand9 = [ Some (Diamonds, Ace); Some (Spades, Queen) ]

let hand10 = [ Some (Hearts, Number 2); Some (Spades, Number 1) ]

let card1 : (suit * card_typ) option = None

let card2 = Some (Spades, Ace)

let card3 = Some (Diamonds, Queen)

let card4 = Some (Hearts, Jack)

let card5 = Some (Spades, King)

let card6 = Some (Clubs, Number 9)

let blackjack_tests =
  [
    bjack_totalsum_test "0 items in list" hand1 0;
    bjack_totalsum_test "1 item - ace" hand2 11;
    bjack_totalsum_test "1 item - number" hand3 1;
    bjack_totalsum_test "1 item - queen" hand4 10;
    bjack_totalsum_test "1 item - jack" hand5 10;
    bjack_totalsum_test "1 item - king" hand6 10;
    bjack_totalsum_test "3 items in list" hand7 20;
    bjack_totalsum_test "3 items - sum 21" hand8 21;
    bjack_totalsum_test "2 items - sum 21" hand9 21;
    bjack_totalsum_test "2 items - only numbers" hand10 3;
    bjack_strcard_test "no card" card1 "";
    bjack_strcard_test "suit spades and card ace" card2 "Ace of Spades";
    bjack_strcard_test "suit diamond and card queen" card3
      "Queen of Diamonds";
    bjack_strcard_test "suit hearts and card jack" card4
      "Jack of Hearts";
    bjack_strcard_test "suit spades and card king" card5
      "King of Spades";
    bjack_strcard_test "suit clubs card number 9" card6 "9 of Clubs";
  ]

let bday_1 = { month = 12; day = 13; year = 2000 }

let bday_1_str = "12/13/2000"

let bday_2 = { month = 12; day = 13; year = 1991 }

let bday_2_str = "12/13/1991"

let bday_3 = { month = 11; day = 21; year = 1991 }

let name_1 = "Maggie Wan"

let name_2 = "Bob Joe"

let bday_4 = { month = 11; day = 20; year = 2002 }

let pair_1 = (name_1, bday_4)

let pair_2 = (name_2, bday_1)

let calendar_tests =
  [
    compare_bday_test "testing same birthday" bday_1 bday_2 true;
    compare_bday_test "testing different birthday" bday_2 bday_3 false;
    bday_to_str_test "bday 1 to string" bday_1 bday_1_str;
    bday_to_str_test "bday 2 to string" bday_2 bday_2_str;
    name_bday_test "pair of name and birthday" name_1 "11" "20" "2002"
      pair_1;
    name_bday_test "pair of name and birthday" name_2 "12" "13" "2000"
      pair_2;
  ]

let suite =
  "test suite"
  >::: List.flatten
         [ client_tests; state_tests; blackjack_tests; calendar_tests ]

let rec print_lst = function
  | [] -> ""
  | h :: t -> h ^ print_lst t

let _ = run_test_tt_main suite