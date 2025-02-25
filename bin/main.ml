open Scuttle.Game
open Scuttle.Game_engine
open ScuttleParser.Parser
open ScuttleParser.Lexer

(** [parse] The main parser *)
let parse () =
  Printf.printf "Parsing\n";
  try
    let lexbuf = Lexing.from_channel stdin in
    Printf.printf "Parsing\n";
    let result = toplevel token lexbuf in
    let ppf = Format.std_formatter in
    Format.fprintf ppf "%a\n" Game.pp_game (Game_engine.eval result)
  with Eof ->
    exit 0

let () =
  Printf.printf "Running\n";
  parse ();
  exit 0
