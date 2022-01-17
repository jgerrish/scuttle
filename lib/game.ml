(** Game module
    Contains structures and functions for containing game state and configuring
    games. *)
open Deck

module Game =
  struct
    (** [players] The players data type is just a string player name *)
    type player = string

    (** [game_element] The different directives / elements that can compose
        games. *)
    type game_element =
      Deck of Deck.deck
    | Players of player list
    
    (** [game] A game list contains information about a game *)
    type game = game_element list
    (* { deck: Deck.deck; players: players } *)

    (** [game_to_str game] Convert a game structure to a string *)
    let game_to_str (game : game) =
      (* TODO: Figure out if there are generic "writers" or "formatters"
         we can provide for types *)
      let printer elem = match elem with
          Deck (d) -> Deck.deck_to_str d
        | Players (p) -> String.concat ", " p
      in
      String.concat ", " (List.map printer game)

  end
