(** The Player module
    This module defines the Player data type and provides some functions
    for creating and working with players. *)
module Player =
  struct
    (** [t] The player data type is just a string player name *)
    type t = string

    (** [create name] Create a new player with the given name
        Returns the string as a player name *)
    let create (name : t) =
      name

    (** [compare] Compare two players
        Return zero if they are equal, non-zero if they are not
        The compare uses lexiocographical order, so it returns -1 if the first
        player is "less" than the second player, +1 if player1 is "greater" than
        the second player *)
    let compare (p1 : t) (p2 : t) =
      String.compare p1 p2

  end
