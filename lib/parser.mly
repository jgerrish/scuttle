%{
    open Scuttle
    open Card
    open Game_engine
%}

%token EOL
%token BUILDDECK
%token SHUFFLE
%token STANDARD
%token REMOVE
%token CLUBS
%token DIAMONDS
%token HEARTS
%token SPADES
%token SEMICOLON2
%token EOF
%start toplevel
%type <Game_engine.game_command> toplevel
%%

toplevel:
  | command SEMICOLON2       { $1 }
;

command:
  | BUILDDECK deck           { (Game_engine.BuildDeck $2) }
;

deck:
  | STANDARD                 { (Game_engine.Standard) }
  | deck REMOVE suit         { (Game_engine.Remove($3, $1)) }
  | deck SHUFFLE             { (Game_engine.Shuffle($1)) }
;

suit:
  | CLUBS                    { Card.Clubs }
  | DIAMONDS                 { Card.Diamonds }
  | HEARTS                   { Card.Hearts }
  | SPADES                   { Card.Spades }
;

%%
