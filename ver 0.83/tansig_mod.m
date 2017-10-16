function out = tansig_mod(in1,in2,in3)
%TANSIG_MOD Hyperbolic tangent sigmoid transfer function, normalized in a way 
% to have output=1 with input=1. Not much error checking is done
% 
% Syntax
%
%   A = tansig_mod(N)
%   dA_dN = tansig_mod('dn',N,A)
%
% Description
% 
%   TANSIG_MOD is a neural transfer function.  Transfer functions
%   calculate a layer's output from its net input.
% 
%   TANSIG_MOD('dn',N,A) returns derivative of A w-respect to N.
%
%(c) Sirotenko Mikhail, 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Apply Transfer Function

if strcmp(in1,'dn')
    out = derivative(in2,in3);
else
    out = apply_transfer(in1);
end

function a = apply_transfer(n,fp)
n = (2/3)*n;
a = 2 ./ (1 + exp(-2*n)) - 1;
a = 1.7159*a;
i = find(~isfinite(a));
a(i) = sign(n(i));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Derivative of Y w/respect to X
function da_dn = derivative(n,a,fp)
da_dn = 0.66666667/1.7159*(1.7159+(a)).*(1.7159-(a));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
