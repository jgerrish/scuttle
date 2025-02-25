(** Game module
    Contains structures and functions for containing game state and configuring
    games. *)
open Deck

module Game =
  struct
    (** [player] The player data type is just a string player name *)
    type player = string

    (** [pp_player formatter player] Pretty print a player using a
        formatter *)
    (* This uses pp_print_text to print the player names breaking on
       spaces with newlines.  It doesn't break on hyphens.  I don't
       know if the correct option is to break on spaces in names.
       Maybe spaces are ok but hyphens aren't? These kinds of
       questions are really interesting work even if they seem boring
       on the surface. *)
    let pp_player ppf (player : player) =
      Format.pp_print_text ppf player

    (** [game_element] The different directives / elements that can compose
        games. *)
    type game_element =
      Deck of Deck.deck
    | Players of player list

    (** [pp_game_element formatter game_element] Pretty print a game
        element using a formatter *)
    let pp_game_element ppf (elem : game_element) =
      match elem with
        Deck (d) -> Deck.pp_deck ppf d
      | Players (p) ->
        (Format.pp_print_list
          ~pp_sep:(fun fmt () -> Format.fprintf fmt ",@ ") pp_player) ppf p

    (** [game] A game list contains information about a game *)
    type game = game_element list
    (* { deck: Deck.deck; players: players } *)

    (** [game_to_string game] Convert a game structure to a string *)
    let game_to_string (g : game) =
      let printer elem = match elem with
          Deck (d) -> Deck.deck_to_string d
        | Players (p) -> String.concat ", " p
      in
      String.concat ", " (List.map printer g)

    (** [pp_game formatter game] Pretty print a game using a
        formatter *)
    let pp_game ppf (g : game) =
      Format.fprintf ppf "%a"
        (Format.pp_print_list
           ~pp_sep:(fun fmt () -> Format.fprintf fmt "@ ")
           pp_game_element) g
  end
