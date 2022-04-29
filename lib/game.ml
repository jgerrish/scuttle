(** Game module
    Contains structures and functions for containing game state and configuring
    games. *)
open Deck
open Player
open PlayerSet

module Game =
  struct
    (** [player] The players data type is just a string player name *)
    type player = Player.t

    (** [t] A game is a structure containing information about a game *)
    type t = { deck : Deck.t; players: PlayerSet.t }

    (** [create] Create a new game *)
    let create = { deck = []; players = PlayerSet.empty }

    (** [game_to_str game] Convert a game structure to a string *)
    let game_to_str (game : t) =
      (* TODO: Figure out if there are generic "writers" or "formatters"
         we can provide for types *)
      Format.sprintf "Deck: %s\nPlayers: %s"
        (Deck.deck_to_str game.deck)
        (PlayerSet.player_set_to_str game.players)

  end
