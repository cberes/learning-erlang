% Learning Erlang

% numbers

2 + 5.
49 * 100.
1892 - 1472.
5 / 2. % returns 2.5
5 div 2. % returns 2
5 rem 2. % returns 1
5 + 16#AE. % can use other bases, 2 to 16

% variables

One = 1. % begin with an uppercase letter
Two = One + One.
Two = 2. % you can redefine a variable as long as it's bound to the same value
% in that case, the = checks for equality

% atoms

atom. % begin with a lowercase letter
'Atom with spaces'. % can also define with quotes
atom = 'atom'.
% do not create too many atoms, because they are not garbage collected

% booleans

true and false.
false or true.
true xor false.
not false.
no (true and true).
[X || X <- [1, 2, 3, 4, 5], X rem 2 =:= 0].
% comparison

5 =:= 5.   % true
1 =:= 0.   % false
1 =/= 0.   % true
5 =:= 5.0. % false
5 ==  5.0. % true
5 /=  5.0. % false
1 < 2.
1 < 1.
1 >= 1.
1 =< 1.

5 =:= atom. % this returns false
5 + atom. % ERROR

% tuples

Point = {X,Y} = {4,5}. % tuples group together sets of terms
{A,B} = Point. % can move values into individual variables
{C,_} = Point. % or can get only one value.

% tagged tuples

TempWithUnits = {celsius, 23.213}. % contain an atom and a value
{kelvin, Temp} = TempWithUnits. % ERROR - atom doesn't match

% lists

[1, 2, 3, {numbers,[4, 5, 6]}, 5.34, atom].

[1, 2, 3] ++ [4, 5]. % mergers the lists
[1, 2, 3] -- [1, 3]. % removes elements from the first list
[1, 2, 3] -- [1, 2] -- [2]. % these operators are right-associative, so result is [2, 3]

hd([1, 2, 3, 4]). % gets the head
tl(1, 2, 3, 4]). % gets the tail
[Head|Tail] = [1, 2, 3, 4]. % can access parts like this
NewList = [100|Tail]. % can use pipe to modify lists, too

[1 |[2 * N || N <- [1, 2, 3, 4]] 2]. % Erlang is weird with lists declared like this
[1 | [2]]. % this is fine, though

% list comprehensions

[2 * N || N <- [1, 2, 3, 4]]. % doubles each list element
[X || X <- [1, 2, 3, 4, 5], X rem 2 =:= 0]. % returns even elements only
% can have lists of comma-separated conditions
[X+Y || X <- [1,2], Y <- [3,4]]. % multiple generators, too (pairs all from first list with all from second list)

% bit shit

<<R,G,B>> = <<16#F09A29:24>>. % separate value into groups of 24 bits
Pixels = <<213,45,132,64,76,32,76,0,0,234,32,15>>.
<<Pix1:24, Pix2:24, Pix3:24, Pix4:24>> = Pixels.
<<X:8, Rest/binary>> = <<Pix1:24>>.
2#00100 = 2#00010 bsl 1.
2#00001 = 2#00010 bsr 1.
2#10101 = 2#10001 bor 2#00101.
% see also: band, bxor, bnot
<<"this is a binary string">>.
<< <<X>> || <<X>> <= <<1,2,3,4,5>>, X rem 2 == 0>>. % binary comprehrension
<< <<(X+1)/integer>> || <<X>> <= <<1,2,3,4,5>> >>.
RGB = [ {R,G,B} || <<R:8, G:8, B:8>> <= Pixels ]. % converts byte values to types
<< <<R:8, G:8, B:8>> || {R, G, B} <- RGB >>. % converts tuples back to byte array

