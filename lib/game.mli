open Deck
open Player

module Game :
  sig
    type player = Player.t
    (** [players] The player data type is just a string player name *)

    type game_element =
      Deck of Deck.t
    | Players of player list
    (** [game_element] The different directives / elements that can compose
        games. *)

    type t = game_element list (* { deck: Deck.deck; players: players } *)
    (** [game] A game list contains information about a game *)

    val game_to_str : t -> string
    (** [game_to_str game] Convert a game structure to a string *)
  end
