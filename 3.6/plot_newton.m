x=-2:0.1:2;
y=54*x.^6+45*x.^5-102*x.^4-69*x.^3+35*x.^2+16*x-4;
plot(x,y);
%Newton迭代法,x0不同,迭代8步
x=1.1 %设置初始值
f=54*x^6+45*x^5-102*x^4-69*x^3+35*x^2+16*x-4;%f(x)
f_=324*x^5+225*x^4-408*x^3-207*x^2+70*x+16;%f(x)的导数
t=x;
x=x-f/f_ %x取得新值
e=abs(x-t)
for i=1:12
    f=54*x^6+45*x^5-102*x^4-69*x^3+35*x^2+16*x-4;%f(x)
    f_=324*x^5+225*x^4-408*x^3-207*x^2+70*x+16;%f(x)的导数
    t=x;
    x=x-f/f_ %x取得新值
    e_=e;
    e=abs(x-t)
    k1=e/(e_^2)
    k2=e/e_
end
