open Tester
open Scuttle__Player

module Test_game =
  struct
    (** [test_game_t] Test creating a game type *)
    let test_game_t =
      let my_deck = Scuttle.Game.Game.Deck
                      [{Scuttle.Card.Card.suit = Scuttle.Card.Card.Clubs;
                        rank = Scuttle.Card.Card.Ace};] in
      let my_players =
        (Scuttle.Game.Game.Players
           ([Player.create "player1"; Player.create "player2"])) in
      let my_game = [my_deck; my_players] in
      Tester.assert_equal (=)
        my_game
        [Scuttle.Game.Game.Deck
           [{Scuttle.Card.Card.suit = Scuttle.Card.Card.Clubs;
             rank = Scuttle.Card.Card.Ace}];
         Scuttle.Game.Game.Players [(1, "player1"); (0, "player2")]]
  end
