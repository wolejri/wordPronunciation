vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).
vowel(y).

consonant(Cha) :-
	not(vowel(Cha)).
  
start:-
	write('Please enter a word to pronounce: '),
	read(Word),
	atom_chars(Word, List),
	split([ ], List),
	!.
split(Result, [ ]) :-
	write_result(Result).
split(Result, [Char1, Char2, Char3 | Tail]) :-
	vowel(Char1),
	consonant(Char2),
	vowel(Char3),
	split(['-', Char3, Char2, Char1 | Result], Tail).
split(Result, [Char1, Char2, Char3, Char4 | Tail]) :-
	vowel(Char1),
	consonant(Char2),
	consonant(Char3),
	vowel(Char4),
	split([Char4, Char3, '-', Char2, Char1 | Result], Tail).
split(Result, [Char1 | Tail]) :-
	split([Char1 | Result], Tail).
write_result([ ]).
write_result([Hea | Tai]) :-
	write_result(Tai),
	write(Hea).

