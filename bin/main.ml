open Scuttle.Game
open Scuttle.Game_engine
open ScuttleParser.Parser
open ScuttleParser.Lexer

(** [parse] The main parser *)
let parse current_game =
  Printf.printf "Parsing\n";
  try
    let lexbuf = Lexing.from_channel stdin in
    Printf.printf "Parsing\n";
    let result = toplevel token lexbuf in
    print_string (Game.game_to_str (Game_engine.eval result current_game));
    print_newline();
  with Eof ->
    exit 0

let () =
  Printf.printf "Running\n";
  parse (Game.create);
  exit 0
