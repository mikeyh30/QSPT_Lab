function [ y ] = tycko( t, t_180 )
%tycko Performs Tycko's pulse for 180_x
%   

y = zeros(size(t));
y = y + (cos(pi/3)+sin(pi/3)*1i)*(t<t_180 | (t >= 2*t_180 & t < 3*t_180));
y = y + (cos(5*pi/3)+sin(5*pi/3)*1i)*(t >= t_180 & t < 2*t_180);

end