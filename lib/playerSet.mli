open Player

(** PlayerSet is the data structure for representing collections of players
    This uses Set as the underlying data structure to store players
    As more functions are needed, we'll expand the interface.
 *)
module PlayerSet :
  sig
    type elt = Player.t
    type t = Set.Make(Player).t
    val empty : t
    val add : elt -> t -> t
    val cardinal : t -> int
    val elements : t -> elt list

    val player_set_to_str : t -> string
  end
