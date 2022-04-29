open Player

module PlayerSet = struct
  module B = Set.Make(Player)
  include B

  let player_set_to_str player_set =
    (String.concat ", "
       (List.map Player.player_to_str (B.elements player_set)))
end
