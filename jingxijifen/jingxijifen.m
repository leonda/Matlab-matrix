function x = jingxijifen(A,x0,t0,t1)
% 计算dx(t)/dt=Ax(t)的近似解，初值条件为x(t0)=x0
% 输入：矩阵A,初值x0,时间步长h
% 输出：近似解x
    n=length(x0);% 未知数个数
    I=eye(n);
    x(1:n,1)=x0;%初始值
    N=20;
    dt=h/2^N;
    At=A*dt;
    BigT=At*(I+At*(I+At*(I+At/4)/3)/2);
    for k=1:N
        BigT=BigT*(I+2*BigT);
    end
    BigT=I+BigT
    m=2^N;
    for i=1:1:m
        x0=BigT*x0;
    end
end