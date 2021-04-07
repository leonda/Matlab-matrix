%%LU分解
function [L,U] = LU(A)
%  inputs:
%         A:系数矩阵，为n*n维方阵
%  outputs：
%         L:单位下三角矩阵，n*n矩阵
%         U:上三角矩阵，n*n矩阵
%获得矩阵的维度
[row_A,col_A] = size(A);
% 判断输入的维度是否满足要求
if (row_A ~= col_A)
    % 不满足则输出错误提示
    print('输入错误！');
else
    % 满足则进行下一步运算
     n=row_A;
     L=zeros(n,n);
     U=zeros(n,n);
     for i=1:row_A
         L(i,i)=1;
     end
     for k = 1:n-1
        % 检查主对角元素第k行的第k个元素是否为0
        if A(k,k) == 0
            print('主对角元素错误！');
        else
            % 循环计算第k+1行到最后一行
            for i = k+1:n
               beishu = A(i,k) / A(k,k); %更新倍数
               L(i,k)=beishu;
               % 更新每一行从第i个元素开始后的所有元素
               for j = k:n
                   A(i,j) = A(i,j) - beishu*A(k,j); % 更新a(i,j)
               end 
            end %for循环结束
        end % 条件2结束
    end % for循环结束
    U=A;
end     