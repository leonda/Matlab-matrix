disp('Cholesky分解')
d=[7 1 -5 1;1 9 2 7;-5 2 7 -1;1 7 -1 9]
e=[13;-9;6;0]
[L,x_]=cholesky(d,e)