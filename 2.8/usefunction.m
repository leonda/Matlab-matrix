n=30 %20,30,50,100 
a=zeros(n,n);
a(1,1)=3;
a(1,2)=-1;
a(n,n-1)=-1;
a(n,n)=3
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
print('共轭梯度法输出结果：')
x_cg=CG(a,b)