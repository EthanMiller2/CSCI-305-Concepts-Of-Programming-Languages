
adjacent(J, K) :- J =:= K + 1.
adjacent(J, K) :- J =:= K - 1.
building([office(_, 5), office(_, 4), office(_, 3), office(_, 2), office(_, 1)]).

layout(X) :- building(X),
        member(office(hunter, A), X), A\=5,
        member(office(laura, B), X), B\=1,
        member(office(jim, C), X), C\=1, C\=5, \+ (adjacent(C, B)),
        member(office(sally, D), X), D>B,
        member(office(jack, E), X), \+ (adjacent(E, C)).
