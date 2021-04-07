%Newton迭代法,x0=-0.7,迭代7步
x=-0.7
for i=1:7
    e=abs(x-1) 
    k=e/(e^2-1)
    f=x^3+x^2+x-3; %f(x)
    f_=3*x^2+2*x+1;%f(x)的导数
    x=x-f/f_ %x取得新值
end
e=abs(x-1) 
k=e/(e^2-1)