% Ce prédicat cherche juste a montrer que l'ia peut déplacer la reine,
% et Qu'elle peut également manger un pion
% ( ici les 2 sont fait a la fois )

% Lancez test. pour voir le résultat.

initialize_game_test([ ' w ',' X ',' w ',' x ',' w ',' x ',' w ',' x ',' w ','   ',
				       ' o ',' w ','   ',' w ',' o ',' w ',' x ',' w ',' x ',' w ',
			 	       ' w ','   ',' w ',' o ',' w ',' o ',' w ',' o ',' w ','   ',
				       ' x ',' w ',' o ',' w ','   ',' w ',' x ',' w ','   ',' w ',
				       ' w ','   ',' w ','   ',' w ','   ',' w ','   ',' w ','   ',
				       '   ',' w ','   ',' w ','   ',' w ','   ',' w ','   ',' w ',
				       ' w ',' x ',' w ','   ',' w ',' o ',' w ',' o ',' w ',' o ',
				       ' o ',' w ',' x ',' w ','   ',' w ',' x ',' w ',' o ',' w ',
				       ' w ','   ',' w ','   ',' w ',' o ',' w ',' o ',' w ',' o ',
				       '   ',' w ','   ',' w ','   ',' w ',' X ',' w ',' o ',' w '
				      ] ).

test10 :-
    initialize_game_test(Board), 
    printBoard(Board),
    findPlay(Board, ' x ', 1, Moves, 3), 
    printIaMove(Moves),
    multiMove(Board, Moves, NewBoard),
    printBoard(NewBoard), !.