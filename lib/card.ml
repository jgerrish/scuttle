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

    let card_rank_to_str card_rank =
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
    (* [card_rank_to_str card_rank] Convert a card_rank type to a string *)
    
    let card_suit_to_str card_suit =
      match card_suit with
          | Clubs -> "Clubs"
          | Diamonds -> "Diamonds"
          | Hearts -> "Hearts"
          | Spades -> "Spades"
    (* [card_suit_to_str card_suit] Convert a card_suit type to a string *)

    let card_to_str card =
      Format.sprintf "%s of %s"
        (card_rank_to_str card.rank)
        (card_suit_to_str card.suit)
    (* [card_to_str card] Convert a card type to a string *)
      
  end
