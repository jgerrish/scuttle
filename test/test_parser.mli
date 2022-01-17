module Test_parser :
sig
  val test_parser_builddeck_standard : unit
  (** [test_parser_builddeck_standard] Test building a standard deck *)
  
  val test_parser_builddeck_standard_minus_suit_card : unit
  (** [test_parser_builddeck_standard_minus_suit_card]
      Test building a standard deck without a suit card *)
end
