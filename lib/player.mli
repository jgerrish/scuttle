(** The Player module
    Games can have multiple players.

    This module defines the Player data type and provides some functions
    for creating and working with players.
 *)
module Player :
sig
  type t = int * string
  (* type t = string *)
  (** [t] The player data type is just a string player name *)

  val player_to_str : t -> string
  (** [player_to_str player] Convert a player to a string *)

  val create : string -> t
  (** [create name] Create a new player with the given name
      This creates a new unique id for the player
      Returns the player as a string

      Example:

      # Player.create("somebody");;
      - : Player.t = "somebody" *)

  val compare : t -> t -> int
  (** [compare] Compare two players
      Return zero if they are equal, non-zero if they are not
      Return zero if they are equal, non-zero if they are not
      The compare uses unique id

      Example:

        # let player1 = Player.create("player1");;
        # let player2 = Player.create("player2");;
        # Player.compare player1 player2;;
        - : int = -1 *)
end
