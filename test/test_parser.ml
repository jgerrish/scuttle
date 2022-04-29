open Tester
open Scuttle.Card
open Scuttle.Deck
open Scuttle.PlayerSet
open Scuttle.Game
open Scuttle.Game_engine
open ScuttleParser__Lexer
open ScuttleParser__Parser

module Test_parser =
  struct
    (** [test_parser_builddeck_standard] Test building a standard deck *)
    let test_parser_builddeck_standard =
      let lexbuf = Lexing.from_string "builddeck standard;;" in
      let game = Game_engine.eval (toplevel token lexbuf) Game.create in
      let standard_deck = Deck.standard_deck in
      let b = game.players in
      Tester.assert_equal (=) game.deck standard_deck;
      Tester.assert_equal (=) (PlayerSet.cardinal b) 0

    (** [test_parser_builddeck_standard_minus_suit_card]
        Test building a standard deck without a suit card *)
    let test_parser_builddeck_standard_minus_suit_card =
      let lexbuf = Lexing.from_string "builddeck standard remove clubs;;" in
      let game = Game_engine.eval (toplevel token lexbuf) Game.create in
      let x = game.deck in
      let b = game.players in
      Tester.assert_equal (=) (List.length x) 51;
      let clubs_filter (card : Card.card) = (card.suit = Card.Clubs) in
      Tester.assert_equal (=) (List.length (List.filter clubs_filter x)) 12;
      Tester.assert_equal (=) (PlayerSet.cardinal b) 0
  end
