f=@(x) exp(abs(x)); %函数表达式

u= -1:0.01:1;
v=f(u); %原函数图像

n=15;
x =linspace(-1,1,n); %等距取值
y = f(x);    %插值节点
v1 = Lagrange(x,y,u); %拉格朗日插值多项式

%Chebyshev
x_0 = 0:10;
x_0 = cos((21-2*x_0)*pi/22); 
y_0 = f(x_0);
v2 = Lagrange(x_0,y_0,u);

set(gcf,'outerposition',get(0,'screensize'));%图像最大化
plot(x,y,'ro',u,v1,'r--',u,v2,'b--',u,v,'k-');
legend('等距取值点','等距拉格朗日插值','Chebyshev','原函数图像')