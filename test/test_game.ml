open Tester
open Scuttle.Player
open Scuttle.PlayerSet
open Scuttle.Game

module Test_game =
  struct
    (** [test_game_t] Test creating a game type *)
    let test_game_t =
      let my_deck = [{Scuttle.Card.Card.suit = Scuttle.Card.Card.Clubs;
                      rank = Scuttle.Card.Card.Ace};] in
      let player1 = Player.create("player1") in
      let player2 = Player.create("player2") in
      let my_players =
        (PlayerSet.(empty |> add player1 |> add player2)) in
      let my_game = { Game.deck = my_deck; Game.players = my_players} in
      Tester.assert_equal (=)
        my_game.deck
        [{Scuttle.Card.Card.suit = Scuttle.Card.Card.Clubs;
          rank = Scuttle.Card.Card.Ace}];
      Tester.assert_equal (=)
        my_game.players
        (Scuttle.PlayerSet.PlayerSet.
         (empty |> add player1 |> add player2))
  end
