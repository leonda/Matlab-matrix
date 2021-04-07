%改进的Euler法求微分方程的解
h=0.01;%步长
u=zeros(1,1/h+1);
u(1,1)=0;
i=2;
for t=1:h:1.99
    u(1,i)=u(1,i-1)+ut_(t,u(1,i-1))*h;
    u(1,i)=u(1,i-1)+h/2*(ut_(t,u(1,i-1))+ut_(t+h,u(1,i)));
    i=i+1;
end
t=(1:h:2);
plot(t,u,'g*')
hold on
plot(t,u,'k-')
title("用Euler法求解微分方程得到的u(x)的函数图像");
xlabel('x');
ylabel('u');