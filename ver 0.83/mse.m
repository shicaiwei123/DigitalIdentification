function out = mse(in1, in2, in3, in4, in5)
%MSE Mean squared performance function
% 
% Syntax
%
%   perf = mse(E,Y,X,FP)
%   dPerf_dy = mse('dy',E,Y,X,perf,FP)
%
% Description
% 
%   mse is a network performance function. It measures the network's performance according to the mean of squared errors.
%   This is very simple replace of NN toolkit version.
% 
%   mse('dy',E,Y,X,perf,FP) returns the derivative of perf with respect to Y.
%
%(c) Sirotenko Mikhail, 2012

if strcmp(in1,'dy')
    out = derivative(in2,in3);
else
    out = apply_perf(in1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Apply 
function a = apply_perf(in)
a = sum(in.^2)/length(in);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Derivative 
function dout_dinp = derivative(out,inp)
dout_dinp = 2*out/length(out);

