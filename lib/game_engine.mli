open Card
open Deck
open Game

module Game_engine :
  sig
    type deck_command =
      Standard
    | Remove of Card.card_suit * deck_command
    | Shuffle of deck_command
    (** [deck_command] Commands that are used to construct decks *)

    val deck_command_to_str : deck_command -> string
    (** [deck_command_to_str deck_command] Convert a deck_command to a string *)

    type game_command =
      []
    | BuildDeck of deck_command
    (* | Shuffle of deck_command *)
    (** [game_command] Commands that are used to build games *)

    val game_command_to_str : game_command -> string
    (** [game_command_to_str game_command] Convert a game_command to a string *)

    type game_commands = game_command list
    (** [game_commands] A list of game commands *)

    val game_commands_to_str : game_commands -> string
    (** [game_commands_to_str game_commands] Convert game_commands to a string *)

    val eval_deck : deck_command -> Deck.deck
    (** [eval_deck deck_command] Evaluate a deck_command, returning a deck of cards *)

    val eval : game_command -> Game.game
    (** [eval game_command] Evaluate a game_command, returning a game *)

    val eval_commands : game_commands -> Game.game
    (** [eval_commands game_commands] Evaluate a list of game commands, returning
        a game *)

  end
