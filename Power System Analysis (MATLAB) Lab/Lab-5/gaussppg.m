% Program for Gauss - Seidel Load Flow Analysis
% Assumption, Bus 1 is considered as Slack bus.
clc;
clear;
ybus = ybusppg();           % Calling program "ybusppg.m" to get Y-Bus. 
busdata = busdata6();       % Calling "busdata6.m" for bus data.

bus = busdata(:,1);         % Bus number.
type = busdata(:,2);        % Type of Bus 1-Slack, 2-PV, 3-PQ.
V = busdata(:,3);           % Initial Bus Voltages.
th = busdata(:,4);          % Initial Bus Voltage Angles.
GenMW = busdata(:,5);       % PGi, Real Power injected into the buses.
GenMVAR = busdata(:,6);     % QGi, Reactive Power injected into the buses.
LoadMW = busdata(:,7);      % PLi, Real Power Drawn from the buses.
LoadMVAR = busdata(:,8);    % QLi, Reactive Power Drawn from the buses.
Qmin = busdata(:,9);        % Minimum Reactive Power Limit
Qmax = busdata(:,10);       % Maximum Reactive Power Limit
nbus = max(bus);            % To get no. of buses
P = GenMW - LoadMW;         % Pi = PGi - PLi, Real Power at the buses.
Q = GenMVAR - LoadMVAR;     % Qi = QGi - QLi, Reactive Power at the buses.
Vprev = V;
toler = 1;                  % Tolerence.
iteration = 1;              % iteration starting
while (toler > 0.00001)     % Start of while loop
    for i = 2:nbus
        sumyv = 0;
        for k = 1:nbus
            if i ~= k
                sumyv = sumyv + ybus(i,k)* V(k);  % Vk * Yik
            end
        end
        if type(i) == 2     % Computing Qi for PV bus
            Q(i) = -imag(conj(V(i))*(sumyv + ybus(i,i)*V(i)));
            if (Q(i) > Qmax(i)) || (Q(i) < Qmin(i))  % Checking for Qi Violation.
                if Q(i) < Qmin(i)   % Whether violated the lower limit.
                    Q(i) = Qmin(i);
                else    % No, violated the upper limit.
                    Q(i) = Qmax(i);
                end
                type(i) = 3;  % If Violated, change PV bus to PQ bus.
            end
        end
        V(i) = (1/ybus(i,i))*((P(i)-j*Q(i))/conj(V(i)) - sumyv); % Compute Bus Voltages.
        if type(i) == 2 % For PV Buses, Voltage Magnitude remains same, but Angle changes.
            V(i) = pol2rect(abs(Vprev(i)), angle(V(i)));
        end
    end
    iteration = iteration + 1;      % Increment iteration count.
    toler = max(abs(abs(V) - abs(Vprev)));     % Calculate tolerance.
    Vprev = V; % Vprev is required for next iteration,  V(i) = pol2rect(abs(Vprev(i)), angle(V(i)));
end     % End of while loop / Iteration
disp('Iterations -');
disp(iteration);       % Total iterations.
disp('Complex Bus Voltage');
disp(V);
disp('Bus Voltages -');
Vmag = abs(V);   % Final Bus Voltages.
disp(Vmag);
disp('Voltage Angles -')
Ang = 180/pi*angle(V);   % Final Bus Voltage Angles in Degree.
disp(Ang);