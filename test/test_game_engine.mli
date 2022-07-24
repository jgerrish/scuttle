module Test_game_engine :
sig
  val test_game_engine_builddeck_standard : unit
  (** [test_game_engine_builddeck_standard] Test building a standard deck *)
  
  val test_game_engine_builddeck_standard_minus_suit_card : unit
  (** [test_game_engine_builddeck_standard_minus_suit_card]
      Test building a standard deck without a suit card *)

  val test_game_engine_builddeck_standard_shuffle : unit
  (** [test_game_engine_builddeck_standard_shuffle]
      Test building a standard deck and shuffling *)
end
