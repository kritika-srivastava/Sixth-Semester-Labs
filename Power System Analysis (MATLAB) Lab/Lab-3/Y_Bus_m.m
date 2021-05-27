%to develop a program for creating Y-Bus marix.
%input require is line data shown below. 
clc;
clear;
%         |  From |  To   |   R     |   X     |     B/2  |  X'mer  |
%         |  Bus  | Bus   |  pu     |  pu     |     pu   | TAP (a) |
linedata =  [1      2       0.01938   0.05917    0.0264         1
             2      3       0.05403   0.22304    0.0246         1
             2      6       0.04699   0.19797    0.0219         1
             2      7       0.05811   0.17632    0.0170         1
             3      4       0.05695   0.17388    0.0173         1
             3      6       0.05695   0.17388    0.0173         1
             4      5       0.06701   0.17103    0.0            1
             4      7       0.01335   0.04211    0.0            1];
fb = linedata(:,1);     % From bus number...
tb = linedata(:,2);     % To bus number...
r = linedata(:,3);      % Resistance, R...
x = linedata(:,4);      % Reactance, X...
b = linedata(:,5);      % Ground Admittance, B/2...
a = linedata(:,6);      % Tap setting value..
z = r + x*1i;            % Z matrix...
y = 1./z;               % To get inverse of each element...
b = b*1i;                % Make B imaginary...
nbus = max(max(fb),max(tb));    % no. of buses...
nbranch = length(fb);           % no. of branches...
Y = zeros(nbus,nbus);        % Initialise YBus...
 
 % Formation of the Off Diagonal Elements...
 for k=1:nbranch
     Y(fb(k),tb(k)) = Y(fb(k),tb(k))-y(k)/a(k);
     Y(tb(k),fb(k)) = Y(fb(k),tb(k));
 end
 
 % Formation of Diagonal Elements....
 for m =1:nbus
     for n =1:nbranch
         if fb(n) == m
             Y(m,m) = Y(m,m) + y(n)/(a(n)^2) + b(n);
         elseif tb(n) == m
             Y(m,m) = Y(m,m) + y(n) + b(n);
         end
     end
 end
disp('Line Data - ');
disp('    From       To        r-pu      x-pu     B/2-pu   TAPPING ');
disp(linedata);
disp('Y-Bus Matrix -');
disp(Y);

