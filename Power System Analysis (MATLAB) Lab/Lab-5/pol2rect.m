% Polar to Rectangular Conversion
function rect = pol2rect(r,o)   % r = magnitude, o = angle in radians.
rect = r*cos(o) + j*r*sin(o);   % rect = real + j*imag