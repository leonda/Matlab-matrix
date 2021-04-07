%% 列主元的LU分解，PA=LU
function [L,U,P] = LUP(A)
%  inputs:
%         A:系数矩阵，为n*n维方阵
%  outputs：
%         L:单位下三角矩阵，n*n矩阵
%         U:上三角矩阵，n*n矩阵
%         P:置换矩阵
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
    U=A;
    P=eye(n);
    for i=1:row_A
         L(i,i)=1;
    end
    for k = 1:row_A-1
        % 找主对角元及以下绝对值最大的进行交换
        [~,rows]=max(abs(U(k:row_A,k)));
        rows=rows+k-1; %rows转换为在矩阵中的行号
        U([k rows],:)=U([rows k],:);%交换矩阵A的两行
        P([k,rows],:)=P([rows,k],:);%交换矩阵P的两行
        %根据计算过程，L同时进行行列变换，最后仍然是单位下三角
        L([k,rows],:)=L([rows,k],:);%交换矩阵L的两行
        L(:,[k,rows])=L(:,[rows,k]);%交换矩阵L的两列
        % 循环计算第k+1行到最后一行
        for i = k+1:row_A
           beishu = U(i,k) / U(k,k); %更新倍数
           L(i,k)=beishu;
           % 更新每一行从第i个元素开始后的所有元素
           for j = k:col_A
             U(i,j) = U(i,j) - beishu*U(k,j); % 更新U(i,j)
           end
        end %for循环结束
    end % for循环结束
end % 条件判断结束
end % 函数结束