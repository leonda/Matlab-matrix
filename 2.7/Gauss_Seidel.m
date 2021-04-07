%Gauss-Seidel迭代法
function x=Gauss_Seidel(A,b)
%  inputs:
%         A:系数矩阵，为n*n维方阵
%         b:载荷矩阵，为n*1维矩阵
%  outputs：
%         x:计算结果向量,为n*1为矩阵

% 判断输入矩阵维度是否满足要求
[row_A,col_A] = size(A);
[row_b,~] = size(b);
format long %为了输出6位小数
% 初始化r_matrix矩阵
x = zeros(row_b,1);
% 判断输入的维度是否满足要求
if (row_A ~= col_A) || (row_A ~= row_b)
    % 不满足则输出错误提示
    print('输入错误！');
else
    % 满足则进行下一步运算
    n=row_A;
    U=zeros(n,n);%对角矩阵
    B_g=zeros(n,n);
    for i=1:n
        for j=i+1:n
            U(i,j)=-A(i,j);
        end
    end 
    
    for i=1:n
        for j=1:n
            B_g(i,j)=-A(i,j);
        end
    end
    for i=1:n
        for j=1:i
            B_g(i,j)=A(i,j);
        end
    end
    f_g=B_g\b; %完成对f的赋值
    B_g=B_g\U; %完成对B的赋值
    norm=Inf;
    e=1e-5;
    while norm>e %退出循环的条件
        x_=x;
        x=B_g*x+f_g;
        norm=abs(x-x_);
    end
    x=vpa(x,6) ; 
end
