(** A module for working with playing cards *)
module Card :
  sig
    type card_suit = Clubs | Diamonds | Hearts | Spades
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
      | Ten
    (** card_rank represents the rank of a card
        The card_rank type is independent of the "value" of the card
        when there is no game context *)

    type card = { suit : card_suit; rank : card_rank; }
    (** A card is a record of a card_suit and card_rank *)

    val card_suit_to_string : card_suit -> string
    (** [card_suit_to_string card_suit] Convert a card_suit type to a string *)

    val card_rank_to_string : card_rank -> string
    (** [card_rank_to_string card_rank] Convert a card_rank type to a string *)

    val card_to_string : card -> string
    (** [card_to_string card] Convert a card type to a string *)

    val pp_card_suit : Format.formatter -> card_suit -> unit
    (** [pp_card_suit formatter card_suit] Pretty print a card suit using a formatter *)

    val pp_card_rank : Format.formatter -> card_rank -> unit
    (** [pp_card_rank formatter card_rank] Pretty print a card rank using a formatter *)

    val pp_card : Format.formatter -> card -> unit
    (** [pp_card formatter card] Pretty print a card using a formatter *)
  end
