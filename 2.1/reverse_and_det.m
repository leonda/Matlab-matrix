%利用LU分解求A的行列式和逆矩阵
function [rever_A,det_A]=reverse_and_det(A)
%%LU分解
%  inputs:
%         A:系数矩阵，为n*n维方阵
%  outputs：
%         A的逆
%         det(A)
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
    det_A=1;
    %A的行列式等于U的对角元的乘积
    for i=1:n
        det_A=det_A*U(i,i);
    end
    I=eye(n);
    Y=zeros(n,n);
     % 回代过程,从最后一行开始
    L=L'%转置变为上三角求解将结果转置即可得到答案I=LY
    for i=1:n    
        Y(n,i) = I(n,i)/L(n,n);
        for k = n-1:-1:1%倒着走
            sum_temp = 0;
            for j = k+1:n
                sum_temp = sum_temp + L(k,j)*Y(j,i);
            end
            Y(k,i) = (I(k,i) - sum_temp)/L(k,k);
        end
    end
    Y=Y';%Y=UX Y转换为正确的下三角
    X=zeros(n,n);
    %求A的逆矩阵
    for i=1:n    
        X(n,i) = Y(n,i)/U(n,n);
        for k = n-1:-1:1%倒着走
            sum_temp = 0;
            for j = k+1:n
                sum_temp = sum_temp + U(k,j)*X(j,i);
            end
            X(k,i) = (Y(k,i) - sum_temp)/U(k,k);
        end
    end
    rever_A=X;
end%函数结束