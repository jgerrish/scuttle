open Tester
open Scuttle__Player

module Test_playerSet =
  struct
    (** [test_playerSet_make] Test making a PlayerSet with one player *)
    let test_playerSet_make =
      let player1 = Player.create("test_player_name") in
      let player2 = Player.create("test_player_name2") in
      let player_set = Scuttle__PlayerSet.PlayerSet.(empty |> add player1) in
      let players = Scuttle__PlayerSet.PlayerSet.elements player_set in
      Tester.assert_equal (=) 1 (Scuttle__PlayerSet.PlayerSet.cardinal player_set);
      Tester.assert_equal (==) player1 (List.hd players);
      (* It should not be player2 *)
      Tester.assert_equal (fun p1 p2 -> (not (p1 = p2))) player2 (List.hd players)

    (** [test_playerSet_make_with_two] Test making a PlayerSet with two players *)
    let test_playerSet_make_with_two =
      let player1 = Player.create("test_player_name") in
      let player2 = Player.create("test_player_name2") in
      let player_set =
        Scuttle__PlayerSet.PlayerSet.(empty |> add player1 |> add player2) in
      Tester.assert_equal (=) 2 (Scuttle__PlayerSet.PlayerSet.cardinal player_set)

    (** [test_playerSet_make_with_two_with_same_name]
        Test making a PlayerSet with two players with the same name *)
    let test_playerSet_make_with_two_with_same_name =
      let player1 = Player.create("test_player_name") in
      let player2 = Player.create("test_player_name") in
      let player_set =
        Scuttle__PlayerSet.PlayerSet.(empty |> add player1 |> add player2) in
      Tester.assert_equal (=) 2 (Scuttle__PlayerSet.PlayerSet.cardinal player_set)

    (** [test_playerSet_make_with_two_with_same_name_and_same_id]
        Test making a PlayerSet with two players with the same name and same id *)
    let test_playerSet_make_with_two_with_same_name_and_same_id =
      let player1 = (0, "test_player_name") in
      let player2 = (0, "test_player_name") in
      let player_set =
        Scuttle__PlayerSet.PlayerSet.(empty |> add player1 |> add player2) in
      Tester.assert_equal (=) 1 (Scuttle__PlayerSet.PlayerSet.cardinal player_set)

  end
