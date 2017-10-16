function out = purelin(in1,in2,in3)
%PURELIN Linear transfer function. Output simply equal to input
% 
% Syntax
%
%   A = purelin(N)
%   dA_dN = purelin('dn',N,A)
%
% Description
% 
%   PURELIN is a neural transfer function.  Transfer functions
%   calculate a layer's output from its net input.
% 
%   PURELIN('dn',N,A) returns derivative of A w-respect to N.
%
%(c) Sirotenko Mikhail, 2012
if strcmp(in1,'dn')
    out = derivative(in2,in3);
else
    out = apply_transfer(in1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Apply Transfer Function
function a = apply_transfer(n)
a = n;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Derivative of Y w/respect to X
function da_dn = derivative(n,a)
da_dn = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%