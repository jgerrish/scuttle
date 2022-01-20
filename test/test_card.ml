open Tester
open Scuttle__Card

module Test_card =
  struct
    let test_card =
      let card = { Card.suit = Card.Clubs; Card.rank = Card.Three } in
      Tester.assert_equal (=) card.suit Card.Clubs;
      Tester.assert_equal (=) card.rank Card.Three

    (* Add a simple unit test using the ppx_inline_tests PPX *)
    let%test_unit "test_card" =
      let card = { Card.suit = Clubs; rank = Three } in
      [%test_eq: Card.card_suit] card.suit Clubs

  end
