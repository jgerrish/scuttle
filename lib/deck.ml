open Card

(** The Deck module has a set of data types and functions for working with
    decks of playing cards. *)
module Deck =
  struct
    (** A deck of cards *)
    type deck = Card.card list

    (** [array_swap arr index1 index2]
        Swap elements at position index1 and index2 in Array array *)
    let array_swap (arr : 'a array) (index1: int) (index2: int) : 'a array =
      let tmp = Array.get arr index1 in
      Array.set arr index1 (Array.get arr index2);
      Array.set arr index2 tmp;
      arr

    (** [swap_pairs length] Generate a list of tuple pairs to swap.
        length is the number of elements in the list to swap *)
    let swap_pairs (length : int) : (int * int) list =
      Random.self_init ();
      let rec swap_pairs_helper (len : int) (lst : (int * int) list) : (int * int) list =
        if len < 1 then lst
        else
          let rand_val = (Random.int (succ len)) in
          swap_pairs_helper (pred len) ((rand_val, len) :: lst)
      in
      swap_pairs_helper (pred length) []

    (** [shuffle_folder arr pair] Adapter to call array_swap with a tuple *)
    let shuffle_folder (arr: 'a array) (pair: (int * int)) : 'a array =
      array_swap arr (fst pair) (snd pair)

    (** [shuffle card_deck] Shuffle a deck of cards *)
    let shuffle (card_deck: deck) : deck =
      Random.self_init ();
      let deck_array = Array.of_list card_deck in
      let swap_pairs = swap_pairs (List.length card_deck) in
      Array.to_list (List.fold_left shuffle_folder deck_array swap_pairs)

    (* Inefficient, but for now it works *)
    (** [remove_card deck card] Remove a single card from the deck *)
    let remove_card (card_deck: deck) card : deck =
      (* Use structural equality
         structural equality (=) tests two values by comparing them, possibly
         doing a "deep" comparison by comparing all of their children elements.
         Physical equality (==) compares the location in memory of two items.

         Comparing things like Constant constructors can be done with
         physical equality, since the types are immutable "global" values that are
         shared throughout a program.

         Strings and structures do not use shared data.
         If two Strings are created with the same content, the underlying data
         will be stored in separate memory locations, so structural equality is
         required to compare them.
       *)
      let comparator x y = not(x = y) in
      List.filter (comparator card) card_deck

    (** [remove_single_card_suit deck suit] Remove a single random card
        of a given suit from a deck *)
    let remove_single_card_suit (card_deck: deck) (card_suit: Card.card_suit) : deck =
      (* Find all cards of the given suit in the deck *)
      let comparator s (c : Card.card) = (s = c.suit) in
      let cards_with_suit = List.filter (comparator card_suit) card_deck in
      let random_card = List.nth cards_with_suit (Random.int (List.length cards_with_suit)) in
      remove_card card_deck random_card
    
    (** Copied from rosettacode.org *)
    let cart_prod l1 l2 =
      List.fold_left (fun acc1 ele1 ->
          List.fold_left (fun acc2 ele2 -> (ele1,ele2)::acc2) acc1 l2) [] l1

    (** [generate_standard_deck] Generate a standard deck *)
    let generate_standard_deck =
      let pairs = cart_prod [Card.Clubs; Card.Diamonds; Card.Hearts; Card.Spades] [Card.Ace; Card.King; Card.Queen; Card.Jack; Card.Two; Card.Three; Card.Four; Card.Five; Card.Six; Card.Seven; Card.Eight; Card.Nine; Card.Ten] in
      let pairs_to_card pair = { Card.suit = fst pair; Card.rank = snd pair } in
      List.map pairs_to_card (List.rev pairs)

    (** [deck_to_str deck] Convert a deck to a string *)
    let deck_to_str deck =
      String.concat ", " (List.map Card.card_to_str deck)

    (** Define a standard deck for convenience *)
    let standard_deck =
      [
        { Card.suit = Clubs; Card.rank = Ace };
        { Card.suit = Clubs; Card.rank = King };
        { Card.suit = Clubs; Card.rank = Queen };
        { Card.suit = Clubs; Card.rank = Jack };
        { Card.suit = Clubs; Card.rank = Two };
        { Card.suit = Clubs; Card.rank = Three };
        { Card.suit = Clubs; Card.rank = Four };
        { Card.suit = Clubs; Card.rank = Five };
        { Card.suit = Clubs; Card.rank = Six };
        { Card.suit = Clubs; Card.rank = Seven };
        { Card.suit = Clubs; Card.rank = Eight };
        { Card.suit = Clubs; Card.rank = Nine };
        { Card.suit = Clubs; Card.rank = Ten };
        { Card.suit = Diamonds; Card.rank = Ace };
        { Card.suit = Diamonds; Card.rank = King };
        { Card.suit = Diamonds; Card.rank = Queen };
        { Card.suit = Diamonds; Card.rank = Jack };
        { Card.suit = Diamonds; Card.rank = Two };
        { Card.suit = Diamonds; Card.rank = Three };
        { Card.suit = Diamonds; Card.rank = Four };
        { Card.suit = Diamonds; Card.rank = Five };
        { Card.suit = Diamonds; Card.rank = Six };
        { Card.suit = Diamonds; Card.rank = Seven };
        { Card.suit = Diamonds; Card.rank = Eight };
        { Card.suit = Diamonds; Card.rank = Nine };
        { Card.suit = Diamonds; Card.rank = Ten };
        { Card.suit = Hearts; Card.rank = Ace };
        { Card.suit = Hearts; Card.rank = King };
        { Card.suit = Hearts; Card.rank = Queen };
        { Card.suit = Hearts; Card.rank = Jack };
        { Card.suit = Hearts; Card.rank = Two };
        { Card.suit = Hearts; Card.rank = Three };
        { Card.suit = Hearts; Card.rank = Four };
        { Card.suit = Hearts; Card.rank = Five };
        { Card.suit = Hearts; Card.rank = Six };
        { Card.suit = Hearts; Card.rank = Seven };
        { Card.suit = Hearts; Card.rank = Eight };
        { Card.suit = Hearts; Card.rank = Nine };
        { Card.suit = Hearts; Card.rank = Ten };
        { Card.suit = Spades; Card.rank = Ace };
        { Card.suit = Spades; Card.rank = King };
        { Card.suit = Spades; Card.rank = Queen };
        { Card.suit = Spades; Card.rank = Jack };
        { Card.suit = Spades; Card.rank = Two };
        { Card.suit = Spades; Card.rank = Three };
        { Card.suit = Spades; Card.rank = Four };
        { Card.suit = Spades; Card.rank = Five };
        { Card.suit = Spades; Card.rank = Six };
        { Card.suit = Spades; Card.rank = Seven };
        { Card.suit = Spades; Card.rank = Eight };
        { Card.suit = Spades; Card.rank = Nine };
        { Card.suit = Spades; Card.rank = Ten };
      ]
  end
