open Deck

module Game :
  sig
    type player = string
    (** [players] The player data type is just a string player name *)

    val pp_player : Format.formatter -> player -> unit
    (** [pp_player formatter player] Pretty print a player using a formatter *)

    type game_element =
      Deck of Deck.deck
    | Players of player list
    (** [game_element] The different directives / elements that can compose
        games. *)

    val pp_game_element : Format.formatter -> game_element -> unit
    (** [pp_game_element formatter game_element] Pretty print a game
        element using a formatter *)

    type game = game_element list (* { deck: Deck.deck; players: players } *)
    (** [game] A game list contains information about a game *)

    val game_to_string : game -> string
    (** [game_to_string game] Convert a game structure to a string *)

    val pp_game : Format.formatter -> game -> unit
    (** [pp_game formatter game] Pretty print a game using a formatter *)
  end
