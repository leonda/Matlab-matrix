%调用三次样条函数中满足第二类边界条件
x=[0 1 2 3 4];
y=[1 3 3 4 2];
y0=0;          %  S''(x0)=f''(x0)=y0   
yn=0;          %  S''(xn)=f''(xn)=yn
x0=0:0.01:4;
s=t_simple(x,y,x0,y0,yn)
plot(x0,s)        %绘制第二边界条件插值函数图像
hold on
grid on
plot(x,y,'o')
xlabel('自变量'), ylabel('因变量')
title('插值点与三次样条函数') 
legend('三次样条插值点坐标','插值点')
