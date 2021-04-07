%Gauss消元法解方程组 2.1GaussElimination.m
%% Gauss消元法
function [res] = GaussElimination(A,b)
%  inputs:
%         A:系数矩阵，为n*n维方阵
%         b:载荷矩阵，为n*1维矩阵
%  outputs：
%         res:计算结果向量,为n*1为矩阵

% 判断输入矩阵维度是否满足要求
[row_A,col_A] = size(A);
[row_b,~] = size(b);

% 初始化r_matrix矩阵
res = zeros(row_b,1);
% 判断输入的维度是否满足要求
if (row_A ~= col_A) || (row_A ~= row_b)
    % 不满足则输出错误提示
    print('输入错误！');
else
    % 满足则进行下一步运算
    n=row_A;
    for k = 1:n-1
        % 检查主对角元素第k行的第k个元素是否为0
        if A(k,k) == 0
            print('主对角元素错误！');
        else
            % 循环计算第k+1行到最后一行
            for i = k+1:n
               beishu = A(i,k) / A(k,k); %更新倍数
               % 更新每一行从第i个元素开始后的所有元素
               for j = k:n
                   A(i,j) = A(i,j) - beishu*A(k,j); % 更新a(i,j)
               end
               b(i,1) = b(i,1) - b(k,1)*beishu; % 更新b(i) 
            end %for循环结束
        end % 条件2结束
    end % for循环结束
    % 回代过程,从最后一行开始
    res(n,1) = b(n,1)/A(n,n);
    for k = row_A-1:-1:1%倒着走
        sum_temp = 0;
        for j = k+1:col_A
            sum_temp = sum_temp + A(k,j)*res(j);
        end
        res(k,1) = (b(k,1) - sum_temp)/A(k,k);
    end
end % 条件判断结束
end % 函数结束