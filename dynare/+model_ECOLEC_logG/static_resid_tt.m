function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 16);

T(1) = y(8)/(y(13)*params(1));
T(2) = y(15)/(y(13)*params(1));
T(3) = (1+params(2))*(y(13)/params(14))^(-params(18));
T(4) = 1-(1-params(3))/params(1);
T(5) = y(1)/params(7);
T(6) = T(4)*T(5)^params(22);
T(7) = (y(24)/params(50))^(-params(19));
T(8) = T(6)*T(7);
T(9) = (y(15)/params(17))^(-params(20));
T(10) = (y(20)/params(16))^(-params(21));
T(11) = ((1+y(26))/(1+params(46)))^params(37);
T(12) = (y(13)/params(4))^params(23);
T(13) = T(5)^params(24);
T(14) = y(5)/params(10);
T(15) = T(14)^params(25);
T(16) = (y(1)*(1+params(58))/params(58))^params(36);

end
