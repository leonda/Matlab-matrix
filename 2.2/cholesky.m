%求矩阵A的Cholesky分解
function [L,x]=cholesky(A,b)
%  inputs:
%         A:系数矩阵，为n*n维方阵
%         b:n*1
%  outputs：
%         L:下三角矩阵，n*n矩阵
%         x:线性方程组的解
% 判断输入矩阵维度是否满足要求
[row_A,col_A] = size(A);

% 判断输入的维度是否满足要求
if (row_A ~= col_A)
    % 不满足则输出错误提示
    print('输入错误！');
else
    % 满足则进行下一步运算
    %初始化L、U、P
    n=row_A;
    L=zeros(n,n);
    L(1,1)=sqrt(A(1,1));
    for i=2:n
        L(i,1)=A(i,1)/L(1,1);
    end
    for i=2:n%逐列计算
        sum=0;
        for k=1:i-1
            sum=sum+L(i,k)*L(i,k);
        end
        L(i,i)=sqrt(A(i,i)-sum);
        for j=i+1:n %从对角元后一个元素计算到该列末尾
            sum=0;
            for k=1:i-1
                sum=sum+L(i,k)*L(j,k);
            end
            L(j,i)=(A(i,j)-sum)/L(i,i);
        end
    end  % end cholesky分解
    %求解方程组
    Y=zeros(n,1);
    %LY=b   
    Y(1) = b(1)/L(1,1);
    for k = 2:n 
        sum_temp = 0;
        for j = 1:k-1
            sum_temp = sum_temp + L(k,j)*Y(j);
        end
        Y(k) = (b(k) - sum_temp)/L(k,k);
    end
    %求x
    L_=L'%L_*x=Y
    x=zeros(n,1);
    x(n) = Y(n)/L_(n,n);
    for k = n-1:-1:1%倒着走
        sum_temp = 0;
        for j = k+1:n
        sum_temp = sum_temp + L_(k,j)*x(j);
        end
        x(k) = (Y(k) - sum_temp)/L_(k,k);
    end
end