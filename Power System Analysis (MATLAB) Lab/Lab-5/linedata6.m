% Line Data for Y-Bus Formation.
function linedata = linedata6()     % Returns linedata.

%         |  From |  To   |   R   |   X   |   B/2 |
%         |  Bus  | Bus   |       |       |       |
linedata = [ 1      2       0.10    0.20     0.02;
             1      4       0.05    0.20     0.02;
             1      5       0.08    0.30     0.03;
             2      3       0.05    0.25     0.03;
             2      4       0.05    0.10     0.01;
             2      5       0.10    0.30     0.02;
             2      6       0.07    0.20     0.025;
             3      5       0.12    0.26     0.025;
             3      6       0.02    0.10     0.01;
             4      5       0.20    0.40     0.04;
             5      6       0.10    0.30     0.03;];