open Tester
open Scuttle__Player

module Test_player =
  struct
    (** [test_player_create] Test the Player.create function *)
    let test_player_create =
      let player = Player.create("test_player_name") in
      Tester.assert_equal (=) player (2, "test_player_name")

    (** [test_player_create_two] Test creating two players with the same name *)
    (* Test ordering is explicitly laid out in the test.ml testrunner *)
    (* This introduces a dependency between the individual tests and the suite,
       which is not ideal
       TODO: Reset the id in each test module
       These functions are partially evaluted before the tests are run
       Or they are run out-of-order (possibly alphabetical,
       since test_game appears to be run first *)
    let test_player_create_two =
      let player1 = Player.create("test_player_name") in
      let player2 = Player.create("test_player_name") in
      Tester.assert_equal (=) player1 (3, "test_player_name");
      Tester.assert_equal (=) player2 (4, "test_player_name")

    (** [test_player_compare_equal] Test comparing the same player *)
    let test_player_compare_equal =
      let player1 = Player.create("player1") in
      let player2 = player1 in
      Tester.assert_equal (=) 0 (Player.compare player1 player2)

    (** [test_player_compare_not_equal] Test comparing two different players *)
    let test_player_compare_not_equal =
      let player1 = Player.create("player1") in
      let player2 = Player.create("player2") in
      Tester.assert_equal (=) (-1) (Player.compare player1 player2)

  end
