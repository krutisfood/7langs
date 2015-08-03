% Day2
%   * Reverse the elements of a list
%rev([Head1|[Head2|[]]],[Head2,Head1]).
%rev([Head1|[Head2|[Head3|[]]]],[Head3,Head2,Head1]).

% Almost...
%rev([Head|Tail],[RevTail,Head]) :- rev([Tail],[RevTail]).
% Try with additional and fact
rev([Head|Tail],[RevTail,Head]) :- rev([Tail],[RevTail]), rev([Head2|Tail2],
rev([Head|[]],[Head]).

% Do I need something more complex? as thus?
% no :-(
%rev([Head|Tail],[[Head2|RevTail],Head]) :- rev([Tail],[RevTail, Head2]).


% First iteration Head = 3, RevTail = 1,2, Tail = ?, rev([?],[1,2]), how do I tell it to reverse the 1,2... 2 = Head therefore RevTail = 1, and Tail = 1, but it doesn't get this far?
% rev(Reversed, [1,2,3]) :- rev(

% rev([Head|Tail], Reversed) :- rev(Tail, [Reversed|Head]).

% To use it call
% rev([1,2,3], ReversedList).
