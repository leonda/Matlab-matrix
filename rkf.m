clear all
y=@(x,u)2./x.*u+x.^2.*exp(x);
h=[0.1,0.05,0.01];
ty=matlabFunction(dsolve('Dy=2/x*y+x^2*exp(x)','y(1)=0','x'));
for i=1:3
    RK(1)=0;
    x=1:h(i):2;
    for j=2:length(x)       
        kR1=y(x(j-1),RK(j-1));
        kR2=y(x(j-1)+h(i)/2,RK(j-1)+h(i)/2*kR1);
        kR3=y(x(j-1)+h(i)/2,RK(j-1)+h(i)/2*kR2);
        kR4=y(x(j),RK(j-1)+h(i)*kR3);
        RK(j)=RK(j-1)+h(i)/6*(kR1+2*kR2+2*kR3+kR4);
    end
    figure(1)
    semilogy(x(2:end),RK(2:end)-ty(x(2:end)))
    hold on
end
figure(1)
title('Runge-Kutta法')
legend(sprintf('h=%.2f',h(1)),sprintf('h=%.2f',h(2)),sprintf('h=%.2f',h(3)))
