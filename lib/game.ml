(** Game module
    Contains structures and functions for containing game state and configuring
    games. *)
open Deck
open Player

module Game =
  struct
    (** [player] The players data type is just a string player name *)
    type player = Player.t

    (** [game_element] The different directives / elements that can compose
        games. *)
    type game_element =
      Deck of Deck.t
    | Players of player list

    (** [t] A game list contains information about a game *)
    type t = game_element list

    (** [game_to_str game] Convert a game structure to a string *)
    let game_to_str (game : t) =
      (* TODO: Figure out if there are generic "writers" or "formatters"
         we can provide for types *)
      let printer elem = match elem with
          Deck (d) -> Deck.deck_to_str d
        | Players (p) ->
           (String.concat ", " (List.map Player.player_to_str p))
      in
      String.concat ", " (List.map printer game)

  end
