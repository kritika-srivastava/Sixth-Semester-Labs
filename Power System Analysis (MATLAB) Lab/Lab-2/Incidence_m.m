% Aim - To develop incidence matrix A using MATLAB
% Data Required - Line Data

% Sample Line data [OR] A matrix [OR] Incidence Matrix
ldata =[1   1   2;
        2   1   3;
        3   1   4;
        4   2   4;
        5   3   4;];
% Calculation work 
A = zeros(5,4);
br_no = ldata(:,1);
from = ldata(:,2);
to = ldata(:,3);
for r=1:5
    A(r,from(r)) = 1;
    A(r,to(r)) = -1;
end
A;

