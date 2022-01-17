(** Rules for playing Old Maid *)

(*
  Actions needed to play a game of Old Maid:
  1.  Remove a card (one of the Queens)
      Generalize to creating a custom deck
      (other games may have Jokers/wildcards, etc.)
  2.  Shuffle the deck
      Generalize to a shuffle function
  3.  Deal the deck, one to each person, round-robin, until all cards are dealt.
  4.  Play starts
      a.  Each player removes all pairs (only pairs, not 3-of-a-kind or 4-of-a-kind)  from their hand face down.
      b.  Player chooses one card, from Dealer's face-down cards.
      c.  If this card is a pair of any in their hand, they can discard them.
      d.  The player then "becomes the dealer" and the player to their left selects
          a card from their hand.
      e.  Continue around the table until all cards have been paired except one.
      f.  The player with the odd card is the Old Maid.
      g.  If any player discards two cards that are not a pair, that player
          loses and becomes the Old Maid.
 *)

