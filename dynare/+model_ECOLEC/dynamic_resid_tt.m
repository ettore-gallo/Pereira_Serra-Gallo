function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 22);

T(1) = y(2)/(y(30)*params(1));
T(2) = (1-params(3))/params(1);
T(3) = y(5)/(y(30)*params(1));
T(4) = (1+params(2))*(y(30)/params(14))^(-params(18));
T(5) = (1-T(2))*(y(1)/params(7))^params(22);
T(6) = (y(9)/params(50))^(-params(19));
T(7) = T(5)*T(6);
T(8) = (y(32)/params(17))^(-params(20));
T(9) = (y(37)/params(16))^(-params(21));
T(10) = ((1+y(10))/(1+params(46)))^params(37);
T(11) = (y(30)/params(4))^params(23);
T(12) = y(18)/params(7);
T(13) = T(12)^params(24);
T(14) = y(22)/params(10);
T(15) = T(14)^params(25);
T(16) = (y(18)*(1+params(58))/params(58))^params(36);
T(17) = y(12)^params(40)*exp(x(it_, 1));
T(18) = y(13)^params(41)*exp(x(it_, 2));
T(19) = y(16)^params(42)*exp(x(it_, 3));
T(20) = y(17)^params(43)*exp(x(it_, 4));
T(21) = y(15)^params(44)*exp(x(it_, 5));
T(22) = y(14)^params(45);

end
