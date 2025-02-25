(* This application explores different options for pretty printing
   data structures and types.

   Cards are a good example to gradually build out and learn printers.

   There are two basic types of printers explored in here:

   - output channel (out_channel) printers that can be used by the
   Printf printf functions.
   - format printers that can be used by the Format printf functions.

   simple and complex

   In addition, there are several different implementations of each of
   these.  These are called "simple" and "complex".  These are not
   official terms and aren't used anywhere else.  They're meant to
   show the use of the %a format or conversion specification.
*)
open Scuttle.Card
open Scuttle.Deck

(* First some functions that convert card suits and ranks to strings *)

(* this function has type card_suit -> string *)
let card_suit_to_string suit =
  match suit with
  | Card.Clubs -> "Clubs"
  | Card.Diamonds -> "Diamonds"
  | Card.Hearts -> "Hearts"
  | Card.Spades -> "Spades"
(** [card_suit_to_string card_suit] Get a string representation of a card suit *)

(* this function has type card_rank -> string *)
let card_rank_to_string rank =
  match rank with
  | Card.Ace -> "Ace"
  | Card.King -> "King"
  | Card.Queen -> "Queen"
  | Card.Jack -> "Jack"
  | Card.Two -> "Two"
  | Card.Three -> "Three"
  | Card.Four -> "Four"
  | Card.Five -> "Five"
  | Card.Six -> "Six"
  | Card.Seven -> "Seven"
  | Card.Eight -> "Eight"
  | Card.Nine -> "Nine"
  | Card.Ten -> "Ten"
(** [card_rank_to_string card_rank] Get a string representation of a card rank *)

(* Now we have some output channel printers that take an output
   channel as the first argument.  This is commonly called
   "printer" *)

(* this function has type out_channel -> card_suit -> unit *)
let pp_card_suit_out_channel printer suit =
  Printf.fprintf printer "%s" (card_suit_to_string suit)
(** [pp_card_suit_out_channel out_channel card_suit]
    Pretty print a card suit to an output channel *)

(* this function has type out_channel -> card_rank -> unit *)
let pp_card_rank_out_channel printer rank =
  Printf.fprintf printer "%s" (card_rank_to_string rank)
(** [pp_card_rank_out_channel out_channel card_rank]
    Pretty print a card rank to an output channel *)

let () = begin
  (* First we setup three calls, one to print a prefix string, then
     call pp_card_suit_out_channel and explicitly pass in stdout, then
     an endline as a suffix string. *)
  Printf.printf "a simple out_channel printer of card suits: ";
  pp_card_suit_out_channel stdout Clubs;
  Printf.printf "\n";
end

(* Now print a card with a simple printer *)
(* It is simple because we explicitly pass in the output channel for
   each printer and subprinter call *)
(* this function has type out_channel -> card -> unit *)
let pp_card_out_channel_simple printer (card : Card.card) =
  pp_card_rank_out_channel printer card.rank;
  Printf.fprintf printer " of ";
  pp_card_suit_out_channel printer card.suit
(** [pp_card_out_channel_simple out_channel card] Pretty
    print a card to an output channel *)

let () = begin
  Printf.printf "a simple out_channel printer of cards: ";
  let card = { Card.suit = Clubs; Card.rank = Ace } in
  pp_card_out_channel_simple stdout card;
  Printf.printf "\n";
end

let () = begin
    (* The above works for a contrived example where output strings can
     be printed sequentially.  But what if they need to be combined in
     non-sequential ways that are dependent on each other? Or just to
     simplify our program and make it easier to read? *)

  (* Next we do some magic here to not have to explicitly pass in the
     output channel. *)

  (* First, in the previous examples we have used the %s "conversion
     specification" (see Module Printf in the OCaML info manual) to
     insert strings into the string we build with fprintf in the pp_
     functions. *)
  (* This time we're going to use %a, which is a conversion
     specification that inserts a "user-defined printer".  The %a
     conversion specification flag requires two arguments, the first
     one should have type out_channel -> 'b -> unit, and the second
     argument should have type 'b.  This is precisely the types we
     created with our pp_ functions.  *)
  Printf.printf
    "a simple out_channel printer of card suits: %a\n"
    pp_card_suit_out_channel Clubs;
end


(* this function has type out_channel -> card -> unit *)
let pp_card_out_channel_complex printer (card : Card.card) =
  Printf.fprintf printer "%a of %a"
    pp_card_rank_out_channel card.rank
    pp_card_suit_out_channel card.suit
(** [pp_card_out_channel_complex out_channel card] Pretty print a card
    to an output channel *)


let () = begin
  (* Now print a card with a simple printer *)
  (* It is complex because we use %a to call the pp_ with our current
     out_channel (stdout for Printf.printf) *)
  (* Here we use %a in two levels, the call here and the fprintf in
     pp_card_out_channel_complex.  printf takes care of threading
     stdout through the calls *)
  let card = { Card.suit = Card.Clubs; Card.rank = Card.Ace } in
  Printf.printf "a complex out_channel printer of cards: %a\n"
    pp_card_out_channel_complex card
end




(* this function has type formatter -> card_rank -> unit *)
let pp_card_rank_formatter ppf (rank : Card.card_rank) =
  Format.fprintf ppf "%s" (card_rank_to_string rank)
(** [pp_card_rank_formatter formatter card_rank] Pretty print a card
    to a formatter *)

(* this function has type formatter -> card_suit -> unit *)
let pp_card_suit_formatter ppf (suit : Card.card_suit) =
  Format.fprintf ppf "%s" (card_suit_to_string suit)
(** [pp_card_suit_formatter formatter card_suit] Pretty print a card
    suit to a formatter *)

(* %a has a different meaning in the Format printf functions than it
   does in Printf printf functions.

   In Printf.fprintf, it expects two arguments, the first being an
   output channel.  In Format.fprintf, it expects a formatter.

   This is why we have to use pp_card_suit_formatter instead of
   pp_card_suit_out_channell *)
let pp_card_formatter_complex ppf (card : Card.card) =
  Format.fprintf ppf "%a of %a"
    pp_card_rank_formatter card.rank
    pp_card_suit_formatter card.suit
(** [pp_card_out_channel_complex out_channel card] Pretty print a card
    to an output channel *)

let () = begin
  let ppf = Format.std_formatter in
  let card = { Card.suit = Card.Clubs; Card.rank = Card.Ace } in
  Format.fprintf ppf "a complex formatter printer of cards: %a\n" pp_card_formatter_complex card
end

(** [comma_space ppf] Print a command and a space to a formatter ppf *)
let comma_space ppf () = Format.pp_print_string ppf ", "

(** [pp_deck formatter deck] Pretty print a deck using a formatter
    without using formatting boxes to break *)
let pp_deck_formatter_no_break formatter deck =
  Format.fprintf formatter "%a"
    (Format.pp_print_list
       ~pp_sep:comma_space
       Card.pp_card) deck

let () =
  let deck = Deck.generate_standard_deck in
  Format.printf "\nnot using boxes for breaks:\n%a\n" pp_deck_formatter_no_break deck

(** [pp_deck_formatter_with_break formatter deck] Pretty print a deck
    using a formatter using formatting boxes to automatically break
    near the edge of the box.

    This printer prints an entire deck of cards, using a custom
    formatter for the separator function.  It uses pretty-printing
    boxes to split near the edge of the box. *)
let pp_deck_formatter_with_break formatter deck =
  Format.fprintf formatter "%a"
    (Format.pp_print_list
       ~pp_sep:(fun fmt () -> Format.fprintf fmt ",@ ")
       Card.pp_card) deck
(* The format string used in the pp_sep formatter has three
   characters.  The comma is treated as a normal comma outputted
   between each list element.  The @ and space is a breaking space
   that uses the box to determine when to print a newline.  If it is
   about to overlow, it prints a newline.  If not, it prints a space.
   This may not be the desired behavior if the output needs to be
   compared, but it provides a prettier printing. *)


(* When you run this, you'll notice the cards split nicely without
   splitting the individual cards themself.

   But according to the documentation for the Format module, an
   pretty-printing box must explicitly be open or the behavior is
   unspecified.

   Some of these defaults including a default dummy box and default
   margins are created by pp_make_formatter in Format.  printf and
   std_formatter both call this function. *)
let () =
  let deck = Deck.generate_standard_deck in
  Format.printf "\nusing boxes for breaks:\n%a\n"
    pp_deck_formatter_with_break deck
