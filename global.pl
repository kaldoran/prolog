debug('yes').

writeDebug(X) :-
	debug('yes'),
	write(X).

isPawn(' x ').
isPawn(' o ').
isBlack(' n ').
isEmpty('   ').

startGame :-
	initialize_game(Board),
	printBoard(Board),
	askMove.

% Ask a move to the player and check it
askMove :-
	write('[Column, Row] ? '),
	read(ColumnRow), check(ColumnRow), nl.

check([Column, Row]) :-
	checkColumn(Column),
	checkRow(Row).

checkColumn(Column) :-
	writeDebug(Column),
	Column > 0,
	Column =< 10.


checkRow(Row) :-
	writeDebug(Row),
	char_code(Row, Code),
	char_code('a', CodeA),
	char_code('k', CodeI),
	CodeA =< Code,
	Code > CodeI, !.

% the grid
initialize_game([ ' w ',' x ',' w ',' x ',' w ',' x ',' w ',' x ',' w ', ' x ',
				  ' x ',' w ',' x ',' w ',' x ',' w ',' x ',' w ',' x ', ' w ',
			 	  ' w ',' x ',' w ',' x ',' w ',' x ',' w ',' x ',' w ', ' x ',
				  '   ',' w ','   ',' w ','   ',' w ','   ',' w ','   ', ' w ',
				  ' w ','   ',' w ','   ',' w ','   ',' w ','   ',' w ', '   ',
				  ' o ',' w ',' o ',' w ',' o ',' w ',' o ',' w ',' o ', ' w ',
				  ' w ',' o ',' w ',' o ',' w ',' o ',' w ',' o ',' w ', ' o ',
				  ' o ',' w ',' o ',' w ',' o ',' w ',' o ',' w ',' o ', ' w '
				 ] ).

% Print the grid of Pawn
printBoard(Board) :-	
	write('  | 1   2   3   4   5   6   7   8   9   10|'), nl,
	printCase,
	printLine(Board, 'a').

printCase :-
	write('  |---|---|---|---|---|---|---|---|---|---|'), nl.

% Stop when all line had been display
printLine(_, 'i') :- !.

% Print a Line of the board
printLine(Board, Line) :- 
	write(Line), write(' |'),
	printLinePawn(Board, Line, 0).

% Call the print of the next line
printLinePawn(Board, Line, 10) :- 
	nl, printCase,
	char_code(Line, Code), 
	NewCode is Code + 1, 
	char_code(NewChar, NewCode),
	printLine(Board, NewChar), !.

% Print a line Pawn by Pawn
printLinePawn([X|L], Line, Pawn) :-
	write(X),
	write('|'),
	NewPawn is Pawn + 1,
	printLinePawn(L, Line, NewPawn).
	
% Invert the current player
invert_player('x', 'o').
invert_player('o', 'x').

% Transforme a Pawn into Queen Pawn
queen('o', 'O').
queen('x', 'X').
