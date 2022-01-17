open Tester
open Scuttle__Card
open Scuttle__Deck
open Scuttle__Game_engine
open Scuttle__Lexer
open Scuttle__Parser

module Test_parser =
  struct
    (** [test_parser_builddeck_standard] Test building a standard deck *)
    let test_parser_builddeck_standard =
      let lexbuf = Lexing.from_string "builddeck standard;;" in
      let game = Game_engine.eval (toplevel token lexbuf) in
      let standard_deck = Deck.standard_deck in
      match (List.hd game) with
        Deck x -> Tester.assert_equal (=) x standard_deck
      | Players _ -> Tester.assert_failure "Expected deck"

    (** [test_parser_builddeck_standard_minus_suit_card]
        Test building a standard deck without a suit card *)
    let test_parser_builddeck_standard_minus_suit_card =
      let lexbuf = Lexing.from_string "builddeck standard remove clubs;;" in
      let game = Game_engine.eval (toplevel token lexbuf) in
      match (List.hd game) with
        Deck x ->
         Tester.assert_equal (=) (List.length x) 51;
         let clubs_filter (card : Card.card) = (card.suit = Card.Clubs) in
         Tester.assert_equal (=) (List.length (List.filter clubs_filter x)) 12
      | Players _ -> Tester.assert_failure "Expected deck"
  end
