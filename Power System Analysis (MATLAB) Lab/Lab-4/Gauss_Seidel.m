%Gauss Seidel Method
%Solution of x in Ax=b using Gauss Seidel Method
% Initialize 'A' 'b' & intial guess 'x'
clc;
clear;
A=[5 -2 3 0 6; -3 9 1 -2 7.4; 2 -1 -7 1 6.7; 4 3 -5 7 9; 2 3.5 6.1 -4 -8.1];
b=[-1 2 3 0.5 3.1];
x=rand(5,1);
n=size(x,1);
normVal=Inf; 

% Tolerence for method
tol=1e-3; GaussItr=0;
% Algorithm: Gauss Seidel Method
plotGauss=[];
while normVal>tol
    x_old=x;
    
    for i=1:n
        
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
        
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    GaussItr=GaussItr+1;
    normVal=norm(x_old-x);
    plotGauss=[plotGauss;normVal];
end
disp('Matrix A -')
disp(A)
disp('Matrix B -')
disp(b)
fprintf('Solution of the system is : \n%f\n%f\n%f\n%f\n%f in %d iterations',x,GaussItr);