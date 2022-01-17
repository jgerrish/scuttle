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

toplevel:
  | command SEMICOLON2       { $1 }
;

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
