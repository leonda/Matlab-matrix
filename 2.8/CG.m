%共轭梯度法求解方程组
function x=CG(A,b)
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
    r=x;
    r1=x;
    p=x;
    c=0;
    while 1
        r=b-A*x;
        p=r;
        t=A*p;
        if dot(p,t)==0
            break
        end
        c=dot(r,r)/dot(p,t);
        x=x+c*p;
        r=r-c*t;
        e=dot(r,r)/dot(p,p);
        p=r+e*p;
        if r==zeros(n,1)
            break
        end
    end
    x=vpa(x,6) ; 
end
