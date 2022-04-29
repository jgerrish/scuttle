%{
    open Scuttle
    open Card
    open Game_engine
%}

%token EOL
%token BUILDDECK
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

// TODO: Figure out a way to pass arguments to the parser
// Have the parser return a first-order function that takes an argument,
// the current game object
toplevel:
  | command SEMICOLON2       { $1 }
;

// TODO: Add an ADDPLAYER command
command:
  | BUILDDECK deck           { (Game_engine.BuildDeck $2) }
//  | ADDPLAYER name           { (Game_engine.
;

deck:
  | STANDARD                 { (Game_engine.Standard) }
  | deck REMOVE suit         { (Game_engine.Remove($3, $1)) }
;

suit:
  | CLUBS                    { Card.Clubs }
  | DIAMONDS                 { Card.Diamonds }
  | HEARTS                   { Card.Hearts }
  | SPADES                   { Card.Spades }
;

%%
