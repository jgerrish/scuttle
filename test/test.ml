open Tester
open Test_card
open Test_deck
open Test_player
open Test_playerSet
open Test_game_engine
open Test_parser

(** The test suite *)
let suite =
    [
      ("test_card", Test_card.test_card);
      ("test_array_swap_empty", Test_deck.test_array_swap_empty);
      ("test_array_swap", Test_deck.test_array_swap);
      ("test_player_create", Test_player.test_player_create);
      ("test_player_create_two", Test_player.test_player_create_two);
      ("test_player_compare_equal", Test_player.test_player_compare_equal);
      ("test_player_compare_not_equal",
       Test_player.test_player_compare_not_equal);
      ("test_playerSet_make", Test_playerSet.test_playerSet_make);
      ("test_playerSet_make_with_two",
       Test_playerSet.test_playerSet_make_with_two);
      ("test_playerSet_make_with_two_with_same_name",
       Test_playerSet.test_playerSet_make_with_two_with_same_name);
      ("test_playerSet_make_with_two_with_same_name_and_same_id",
       Test_playerSet.test_playerSet_make_with_two_with_same_name_and_same_id);
      ("test_game_engine_builddeck_standard",
       Test_game_engine.test_game_engine_builddeck_standard);
      ("test_game_engine_builddeck_standard_minus_suit_card",
       Test_game_engine.test_game_engine_builddeck_standard_minus_suit_card);
      ("test_parser_builddeck_standard",
       Test_parser.test_parser_builddeck_standard);
      ("test_parser_builddeck_standard_minus_suit_card",
       Test_parser.test_parser_builddeck_standard_minus_suit_card);
    ]


(** Runs the tests.  Exits the interpreter if run in a REPL *)
let () : unit =
  let run : unit =
    Tester.run_test_suite suite in
  Printf.printf "Running tests\n";
  run;
  exit 0

