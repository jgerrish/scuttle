open Tester
open Scuttle__Deck

module Test_deck =
  struct
    (** [test_array_swap_empty] Test swapping elements in an empty array *)
    let test_array_swap_empty =
      let test_array = [||] in
      Tester.assert_raises
        (Invalid_argument "index out of bounds")
        (fun _ -> Deck.array_swap test_array 0 1)

    (** [test_array_swap] Test swapping elements in an array with three elements *)
    let test_array_swap =
      let test_array = [|0; 1; 2|] in
      let test_array = Deck.array_swap test_array 0 1 in
      Tester.assert_equal (=) (Array.get test_array 0) 1;
      Tester.assert_equal (=) (Array.get test_array 1) 0;
      Tester.assert_equal (=) (Array.get test_array 2) 2
  end
