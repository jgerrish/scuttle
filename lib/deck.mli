open Card

(** The Deck module has a set of data types and functions for working with
    decks of playing cards. *)
module Deck :
  sig
    type deck = Card.card list
    (** A deck of cards *)

    (** These are internal functions, but for testing include them here *)

    val array_swap : 'a array -> int -> int -> 'a array
    (** [array_swap arr index1 index2]
        Swap elements at position index1 and index2 in Array array *)

    val swap_pairs : int -> (int * int) list
    (** [swap_pairs length] Generate a list of tuple pairs to swap.
        length is the number of elements in the list to swap *)

    val shuffle_folder : 'a array -> int * int -> 'a array
    (** [shuffle_folder arr pair] Adapter to call array_swap with a tuple *)

    (** These are public functions *)
    
    val shuffle : deck -> deck
    (** [shuffle deck] Shuffle a deck of cards *)

    val remove_card : deck -> Card.card -> deck
    (** [remove_card deck card] Remove a single card from the deck *)

    val remove_single_card_suit : deck -> Card.card_suit -> deck
    (** [remove_single_card_suit deck suit] Remove a single random card
        of a given suit from a deck *)

    val generate_standard_deck : deck
    (** [generate_standard_deck] Generate a standard deck *)

    val deck_to_str : deck -> string
    (** [deck_to_str deck] Convert a deck to a string *)

    val standard_deck : deck
    (** [standard_deck] A standard deck of cards *)
  end
