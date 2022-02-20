%{
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
  | BUILDDECK deck           { (BuildDeck $2) }
;

deck:
  | STANDARD                 { (Standard) }
  | deck REMOVE suit         { (Remove($3, $1)) }
;

suit:
  | CLUBS                    { Clubs }
  | DIAMONDS                 { Diamonds }
  | HEARTS                   { Hearts }
  | SPADES                   { Spades }
;

%%
