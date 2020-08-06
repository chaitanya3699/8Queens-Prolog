%In this program we used Depth First Search strategy.
:- dynamic dfs/2, depth_first/3, check_safety/2, move/3.

%predicate to solve the depth_first of a list of nodes.

dfs(Node, Result):-
    depth_first(Node, Path_list, 8), %This returns a list of lists of nodes visited in the path.
    last(Path_list, Result). %since last list will be our output, returning that.

%predicate to solve this problem using DFS strategy.
% If current node is a goal state, then stop.

depth_first(_,[],0).
%Else continue to search, move to NextNode and collect all the nodes in the path.
% here 'V' is an accumulator. 

depth_first(Node, [NextNode|Path], V):-
    move(Node, NextNode, V),
    V1 is V-1,
    depth_first(NextNode, Path, V1).

%predicate to check whether the queen position is safe or not.
check_safety(_,[]). %base case.
check_safety(X/Y, [X1/Y1|Rs]):-
    not(Y = Y1), %not in same row
    not(X = X1), %not in same column
    X1-X =\= Y1-Y, %not in ascending diagonal
    X1-X =\= Y-Y1, %not in descending diagonal
    check_safety(X/Y, Rs).

%predicate which adds safe position (X/Y) of a queen each time to the resultant list.
move(Qlist, [X/Y|Qlist], V):-
    X is V, %each X takes the values from 8 to 1.
    member(Y, [1,2,3,4,5,6,7,8]), %getting some value for y.
    check_safety(X/Y, Qlist). %checking if position is safe or not.
