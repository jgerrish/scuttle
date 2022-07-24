{
	open Parser
        exception Eof
}


rule token = parse
      (* "#" [^'\n']* '\n'   { Lexing.new_line lexbuf; token lexbuf } *)
  | '\n'               { Lexing.new_line lexbuf; token lexbuf }
    (* | '\n'                  { EOL } *)
  | [' ' '\t']            { token lexbuf }
  | "builddeck"           { BUILDDECK }
  | "shuffle"             { SHUFFLE }
  | "standard"            { STANDARD }
  | "remove"              { REMOVE }
  | "clubs"               { CLUBS }
  | "diamonds"            { DIAMONDS }
  | "hearts"              { HEARTS }
  | "spades"              { SPADES }
  | ";;"                  { SEMICOLON2 }
  | eof                   { EOF }
{
}
