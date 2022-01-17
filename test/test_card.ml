open Tester
open Scuttle__Card

module Test_card =
  struct
    let test_card =
      let card = { Card.suit = Card.Clubs; Card.rank = Card.Three } in
      Tester.assert_equal (=) card.suit Card.Clubs;
      Tester.assert_equal (=) card.rank Card.Three
  end
