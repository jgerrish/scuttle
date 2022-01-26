(** The Player module
    Games can have multiple players.

    This module defines the Player data type and provides some functions
    for creating and working with players.
 *)
module Player :
sig
  type t = string
  (** [t] The player data type is just a string player name *)

  val create : string -> t
  (** [create name] Create a new player with the given name
      Returns the player as a string

      Example:

      # Player.create("somebody");;
      - : Player.t = "somebody" *)

  val compare : t -> t -> int
  (** [compare] Compare two players
      Return zero if they are equal, non-zero if they are not
      The compare uses lexiocographical order, so it returns -1 if the first
      player is "less" than the second player, +1 if player1 is "greater" than
      the second player

      Example:

        # let player1 = Player.create("player1");;
        # let player2 = Player.create("player2");;
        # Player.compare player1 player2;;
        - : int = -1 *)
end
