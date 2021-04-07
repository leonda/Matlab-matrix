n=100 %20,30,50,100 
a=zeros(n,n);
a(1,1)=3;
a(1,2)=-1;
a(n,n-1)=-1;
a(n,n)=3;
for i=2:n-1
    a(i,i-1)=-1;
    a(i,i)=3;
    a(i,i+1)=-1;
end
a
b=zeros(n,1);
b(1,1)=2;
b(n,1)=2;
for i=2:n-1
    b(i,1)=1;
end
print('Jacobi迭代输出结果：')
x_j=jacobi(a,b)
print("Gauss-Seidel迭代输出结果：")
x_g=Gauss_Seidel(a,b)