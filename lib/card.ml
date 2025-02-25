(** The Card module has a set of data types and functions for working with
    playing cards. *)
module Card =
  struct
    type card_suit = Clubs | Diamonds | Hearts | Spades
    (** card_suit represents the suit of a card *)

    (** card_rank represents the rank of a card
        The card_rank type is independent of the "value" of the card
        when there is no game context *)
    type card_rank = Ace | King | Queen | Jack
                     | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten

    (** A card is a record of a card_suit and card_rank *)
    type card = {suit: card_suit; rank: card_rank}

    let pp_card_suit printer card_suit =
      let s = match card_suit with
          | Clubs -> "Clubs"
          | Diamonds -> "Diamonds"
          | Hearts -> "Hearts"
          | Spades -> "Spades" in
      Format.fprintf printer "%s" s
      (** [pp_card_suit formatter card_suit] Pretty print a card suit to a formatter *)

    let pp_card_rank printer card_rank =
      let s = match card_rank with
          | Ace -> "Ace"
          | King -> "King"
          | Queen -> "Queen"
          | Jack -> "Jack"
          | Two -> "Two"
          | Three -> "Three"
          | Four -> "Four"
          | Five -> "Five"
          | Six -> "Six"
          | Seven -> "Seven"
          | Eight -> "Eight"
          | Nine -> "Nine"
          | Ten -> "Ten" in
      Format.fprintf printer "%s" s
    (** [pp_card_rank formatter card_rank] Pretty print a card rank to a formatter *)

    let card_rank_to_string card_rank =
      match card_rank with
          | Ace -> "Ace"
          | King -> "King"
          | Queen -> "Queen"
          | Jack -> "Jack"
          | Two -> "Two"
          | Three -> "Three"
          | Four -> "Four"
          | Five -> "Five"
          | Six -> "Six"
          | Seven -> "Seven"
          | Eight -> "Eight"
          | Nine -> "Nine"
          | Ten -> "Ten"
    (* [card_rank_to_string card_rank] Convert a card_rank type to a string *)
    
    let card_suit_to_string card_suit =
      match card_suit with
          | Clubs -> "Clubs"
          | Diamonds -> "Diamonds"
          | Hearts -> "Hearts"
          | Spades -> "Spades"
    (* [card_suit_to_string card_suit] Convert a card_suit type to a string *)

    let card_to_string card =
      Format.sprintf "%s of %s"
        (card_rank_to_string card.rank)
        (card_suit_to_string card.suit)
    (* [card_to_string card] Convert a card type to a string *)

    let pp_card printer card =
      Format.fprintf printer "%s of " (card_rank_to_string card.rank);
      Format.fprintf printer "%s" (card_suit_to_string card.suit)
      
      (* Format.fprintf printer "%a of " pp_card_rank card.rank; *)
      (* Format.fprintf printer "%a" pp_card_suit card.suit *)
    (* Format.fprintf printer "%a of %a" pp_card_rank card.rank pp_card_suit card.suit *)
    (** [pp_card formatter card] Pretty print a card to a formatter *)


  end
