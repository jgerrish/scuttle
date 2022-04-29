open Deck
open Player
open PlayerSet

module Game :
  sig
    type player = Player.t
    (** [players] The player data type is just a string player name *)

    type t = { deck: Deck.t; players: PlayerSet.t; }
    (** [game] A game list contains information about a game *)

    (** [create] Create a new game *)
    val create : t

    val game_to_str : t -> string
    (** [game_to_str game] Convert a game structure to a string *)
  end
