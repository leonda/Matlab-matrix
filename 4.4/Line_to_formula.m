n=30
format short
x=zeros(1,n);
y=zeros(1,n);
for i=1:6
    x(i)=(i-1)/n;
    y(i)=x(i)*x(i);
end
a=polyfit(x,y,1) %自变量，因变量，阶数
syms x c1 c2
f=int ((x^2-c1-c2*x)^2,x,0,1)

%fun=@(c)c(1)^2 + c(1)*c(2) - 2/3*c(1) + c(2)^2/3 - c(2)/2 + 1/5;
%c0=[0,0];
%[c,val]=fminunc(fun,c0);
