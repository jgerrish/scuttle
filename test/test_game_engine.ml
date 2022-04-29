open Tester
open Scuttle.Card
open Scuttle.Deck
open Scuttle.Game
open Scuttle.Game_engine

module Test_game_engine =
  struct
    (** [test_game_engine_builddeck_standard] Test building a standard deck *)
    let test_game_engine_builddeck_standard =
      let empty_game = Game.create in
      let my_game = Game_engine.eval (BuildDeck (Standard)) empty_game in
      let standard_deck = Deck.standard_deck in
        Tester.assert_equal (=) my_game.deck standard_deck

    (** [test_game_engine_builddeck_standard_minus_suit_card]
        Test building a standard deck without a suit card *)
    let test_game_engine_builddeck_standard_minus_suit_card =
      let game = Game_engine.eval
                   (Game_engine.BuildDeck
                      (Game_engine.Remove (Card.Clubs, Game_engine.Standard)))
                   Game.create in
      let x = game.deck in
      Tester.assert_equal (=) (List.length x) 51;
      let clubs_filter (card : Card.card) = (card.suit = Card.Clubs) in
      Tester.assert_equal (=) (List.length (List.filter clubs_filter x)) 12
  end
