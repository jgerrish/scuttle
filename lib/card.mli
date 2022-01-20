(* open Sexplib *)

(** A module for working with playing cards *)
module Card :
  sig
    type card_suit = Clubs | Diamonds | Hearts | Spades [@@deriving compare, sexp]
    (** card_suit represents the suit of a card *)

    type card_rank =
        Ace
      | King
      | Queen
      | Jack
      | Two
      | Three
      | Four
      | Five
      | Six
      | Seven
      | Eight
      | Nine
      | Ten [@@deriving compare, sexp]
    (** card_rank represents the rank of a card
        The card_rank type is independent of the "value" of the card
        when there is no game context *)

    type card = { suit : card_suit; rank : card_rank; } [@@deriving compare, sexp]
    (** A card is a record of a card_suit and card_rank *)

    val card_suit_to_str : card_suit -> string
    (** [card_suit_to_str card_suit] Convert a card_suit type to a string *)

    val card_rank_to_str : card_rank -> string
    (** [card_rank_to_str card_rank] Convert a card_rank type to a string *)

    val card_to_str : card -> string
    (** [card_to_str card] Convert a card type to a string *)
  end
