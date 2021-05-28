1. Keep all the 5 files in the same directory / folder.

2. "pol2rect.m" coverts Polar to Rectangular coordinates.

3. There are some assumptions used.
          a. Bus number 1 is considered as the Slack bus in loadflow. ("gaussppg.m")
          b. The first row in busdata matrix, corresponds to slack bus. ("busdata6.m")
          
4. For computing Admittance or Impedance Matrix, just we need to run "ybusppg.m" only.

5. For computing Bus Voltage and Angles, just we need to run "gaussppg.m" only.
