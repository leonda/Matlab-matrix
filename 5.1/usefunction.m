%复化的梯形求积公式
n=200%分成多少个小区间
a=0;%积分下界
b=pi;%积分上界
h=(b-a)/n;%步长
x=zeros(1,n+1);
res=0;
for i=1:n+1
    x(i)=a+h*(i-1);
end
for i=2:n
    res=res+f(x(i));
end
Tn=h/2*(f(x(1))+2*res+f(x(n+1)))

%复化的Simpson求积公式
xx=zeros(1,2*n+1);%有2n+1个数
for i=1:2*n+1
    xx(i)=a+h/2*(i-1);
end
res1=0;
for i=2:2:2*n
    res1=res1+f(xx(i));
end
res1=res1*4;%xk+1/2部分
res2=0;
for i=3:2:2*n-1
    res2=res2+f(xx(i));
end
res2=2*res2;%除了首尾的整数部分
Sn=h/6*(f(xx(1))+res1+res2+f(xx(2*n+1)))
e=abs(Tn-Sn)