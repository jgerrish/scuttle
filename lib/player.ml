(** The Player module
    This module defines the Player data type and provides some functions
    for creating and working with players. *)
module Player =
  struct
    (** [t] The player data type is just a string player name *)
    (* Add a unique identifier to the player type, so we can have players with
       the same name.
       The player uses a simple tuple to store data, we'll probably move to a
       structure later. *)
    type t = int * string
    (* type t = string *)


    (** [player_id_generator]
        player_id_generator is a private function that is used to generate
        unique IDs for the create function.
        It does this by creating a closure around the id value, incrementing
        it each time the function is called. *)
    let (player_id_generator) =
      (* increment our id, setting and storing the new value *)
      (* set to -1, so the first call returns 0 *)
      let id = ref (-1) in
      let generator () =
        id := !id+1;
        !id
      in (generator)

    (** [create name] Create a new player with the given name
        Returns the string as a player name *)
    let create (name : string) =
      (* This function has side-effects *)
      let id = player_id_generator () in
      (id, name)

      (** [compare] Compare two players
        Return zero if they are equal, non-zero if they are not
        The compare uses unique id *)
    let compare (p1 : t) (p2 : t) =
      Stdlib.compare (fst p1) (fst p2)

  end
