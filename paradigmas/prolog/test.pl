tqs(P,A,B,C) :- between(1,P,A),between(1,P,B),between(1,P,C), P is A+B+C.
% , A+B > C, A+C > B, B+C > A.
