% Bus data for Load Flow Analysis.
function busdata = busdata6()     % Returns busdata.

%         |Bus | Type | Vsp | theta | PGi | QGi | PLi | QLi | Qmin | Qmax |
busdata = [ 1     1    1.05     0     0.0    0    0      0      0      0;
            2     2    1.05     0     0.5    0    0      0    -0.5   1.0;
            3     2    1.07     0     0.6    0    0      0    -0.5   1.5;
            4     3    1.0      0     0.0    0    0.7    0.7     0     0;
            5     3    1.0      0     0.0    0    0.7    0.7     0     0;
            6     3    1.0      0     0.0    0    0.7    0.7     0     0 ];