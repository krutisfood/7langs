% How to drive gnu prolog
% Start prolog
% ['user'].  % takes you to user mode to enter the program
% enter the knowledge or load it from this running gprolog --j
% <ctrl>+d to get back to query mode
% Ask a question!  e.g.
%   knowledge('Terry Pratchett', What).
%   plays('Dave Grohl', What).
%   plays(Who, guitar).
% to get next answer type ;
% to get all answers type a
% To load facts from file
%    gprolog --consult-file ./knowledge.pl


% Day 1, all books by an author
%   knowledge('Terry Pratchett', What).
% All musicians who play guitar
%   plays(Who, guitar). 


% Day 2
% Uses, IBM's Watson uses prolog for NPL sections
% Tutes http://www.amzi.com/AdventureInProlog/advtop.php
% Fibonnaci from here http://en.literateprograms.org/Fibonacci_numbers_(Prolog)

% Do
%   * Reverse the elements of a list
%   * Find the smallest element of a list
%   * Sort the elements of a list

% Towers of Hanoi problem https://en.wikipedia.org/wiki/Tower_of_Hanoi
/*
 * The objective of the puzzle is to move the entire stack to another rod, obeying the following simple rules:
 * 
 * Only one disk can be moved at a time.
 * Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack.
 * No disk may be placed on top of a smaller disk.
 * With three disks, the puzzle can be solved in seven moves. The minimum number of moves required to solve a Tower of Hanoi puzzle is 2n - 1, where n is the number of disks.
 */
