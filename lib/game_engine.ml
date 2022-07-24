(** Game_engine module
    This provides a symbolic language or AST and parser for defining games
    The language is more functional than declarative like other configuration
    languages.

    The parser builds the Game_engine tree,
    Game_engine walks it and builds the Game.
 *)
open Card
open Deck
open Game

module Game_engine =
  struct
    (** [deck_command] Commands that are used to construct decks *)
    type deck_command =
      | Standard
      | Remove of Card.card_suit * deck_command
      | Shuffle of deck_command

    (** [deck_command_to_str deck_command] Convert a deck_command to a string *)
    let rec deck_command_to_str card_deck =
      match card_deck with
      | Standard -> "standard"
      | Remove (card_suit, deck) ->
         "remove "
         ^ (Card.card_suit_to_str card_suit)
         ^ (deck_command_to_str deck)
      | Shuffle (deck) -> "shuffle " ^ (deck_command_to_str deck)

    (** [game_command] Commands that are used to build games *)
    type game_command =
      | []
      | BuildDeck of deck_command

    (** [game_command_to_str game_command] Convert a game_command to a string *)
    let game_command_to_str command =
      match command with
      | [] -> ""
      (* ^ is string concatenation *)
      | BuildDeck (deck) -> "builddeck " ^ (deck_command_to_str deck)
      (* | Shuffle (deck) -> "shuffle " *)
      (*    ^ (deck_command_to_str deck) *)
    
    (** [game_commands] A list of game commands *)
    type game_commands = game_command list

    (** [game_commands_to_str game_commands] Convert game_commands to a string *)
    let game_commands_to_str commands =
      String.concat ", " (List.map game_command_to_str commands)

    (** [eval_deck deck_command] Evaluate a deck_command, returning a deck of cards *)
    let rec eval_deck deck_command : Deck.deck =
      match deck_command with
        Standard -> Deck.standard_deck
      | Remove (card_suit, deck) ->
         Deck.remove_single_card_suit (eval_deck deck) card_suit
      | Shuffle (deck) ->
         Deck.shuffle (eval_deck deck)

    (** [eval game_command] Evaluate a game_command, returning a game *)
    let eval (game : game_command) : Game.game =
      match game with
        [] -> ([] : Game.game)
      | BuildDeck (deck_def) -> ([(Game.Deck (eval_deck deck_def))] : Game.game)

    (** [eval_commands game_commands] Evaluate a list of game commands, returning
        a game *)
    let rec eval_commands (commands : game_commands) : Game.game =
      Printf.printf "Parsing eval_commands\n";
      match commands with
        [] -> ([] : Game.game)
      | x::xs -> (eval x) @ (eval_commands xs)

    (*
    (** [shuffle] The type of shuffle to use on the deck *)
    type shuffle =
      (* A random shuffle *)
      | Random
      | None

    (* What are the ending conditions for a deal? *)
    type deal_end =
      (* Deal until all the cards are dealt *)
      Exhaustion

    (* How do we deal the cards *)
    type deal_algorithm =
      (* One card per-person, around the table *)
      RoundRobin

    type deal =
      | Deal of deal_algorithm * deal_end
     *)
  end
