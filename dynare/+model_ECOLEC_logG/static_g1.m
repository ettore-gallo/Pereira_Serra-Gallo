function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = model_ECOLEC_logG.static_g1_tt(T, y, x, params);
end
g1 = zeros(46, 46);
g1(1,3)=1;
g1(1,5)=(-((1-params(30)*y(32))*y(14)));
g1(1,14)=(-((1-params(30)*y(32))*y(5)));
g1(1,32)=(-(y(5)*y(14)*(-params(30))));
g1(2,4)=1;
g1(2,8)=(-((1-params(28))*(1-params(31)*y(33))*y(12)/(y(13)*params(1))));
g1(2,9)=(-((1-params(28))*(1-params(31)*y(33))));
g1(2,10)=(-((1-params(28))*(1-params(31)*y(33))));
g1(2,11)=(-((1-params(28))*(1-params(31)*y(33))));
g1(2,12)=(-((1-params(28))*(1-params(31)*y(33))*T(1)));
g1(2,13)=(-((1-params(28))*(1-params(31)*y(33))*T(17)));
g1(2,33)=(-((y(11)+y(10)+y(9)+y(8)*y(12)/(y(13)*params(1)))*(1-params(28))*(-params(31))));
g1(3,1)=(-(params(28)*(1-params(31)*y(33))));
g1(3,5)=(-(params(28)*(1-params(31)*y(33))*(-y(14))));
g1(3,6)=(-(params(28)*(1-params(31)*y(33))*(-(1-params(27)))));
g1(3,7)=(-(params(28)*(1-params(31)*y(33))*(-(1-params(27)))));
g1(3,8)=1-1/(y(13)*params(1));
g1(3,13)=(-((-(y(8)*params(1)))/(y(13)*params(1)*y(13)*params(1))));
g1(3,14)=(-(params(28)*(1-params(31)*y(33))*(-y(5))));
g1(3,33)=(-((y(1)-y(14)*y(5)-(1-params(27))*(y(7)+y(6)))*params(28)*(-params(31))));
g1(4,1)=(-(y(28)*1/params(58)));
g1(4,2)=1;
g1(4,28)=(-(y(1)/params(58)));
g1(5,6)=1;
g1(5,7)=(-(params(51)/params(5)));
g1(6,6)=(-1);
g1(6,17)=T(4);
g1(7,6)=(-params(27));
g1(7,13)=(-((-(params(1)*y(23)))/(y(13)*params(1)*y(13)*params(1))));
g1(7,23)=1-1/(y(13)*params(1));
g1(8,2)=(-1);
g1(8,6)=1-params(27);
g1(8,10)=1;
g1(8,13)=y(23)*(-(params(1)*y(15)))/(y(13)*params(1)*y(13)*params(1));
g1(8,15)=y(23)*1/(y(13)*params(1));
g1(8,23)=T(2);
g1(9,1)=1;
g1(9,4)=(-1);
g1(9,5)=(-y(14));
g1(9,6)=(-1);
g1(9,7)=(-1);
g1(9,8)=(-(params(31)*y(33)*y(12)/(y(13)*params(1))));
g1(9,9)=(-(params(31)*y(33)));
g1(9,10)=(-(params(31)*y(33)));
g1(9,11)=(-(params(31)*y(33)));
g1(9,12)=(-(params(31)*y(33)*T(1)));
g1(9,13)=(-(params(31)*y(33)*T(17)));
g1(9,14)=(-y(5));
g1(9,33)=(-(params(31)*(y(8)*y(12)/(y(13)*params(1))+y(10)+y(11)+y(9))));
g1(10,18)=1;
g1(11,1)=(-(1/(params(34)*y(16))));
g1(11,16)=(-((-(y(1)*params(34)))/(params(34)*y(16)*params(34)*y(16))));
g1(11,34)=1;
g1(12,1)=(-(1/params(35)));
g1(12,5)=1;
g1(13,14)=(-(1/params(35)));
g1(13,20)=1;
g1(14,13)=(-(y(20)*(1+params(2))*1/params(14)*getPowerDeriv(y(13)/params(14),(-params(18)),1)));
g1(14,20)=(-T(3));
g1(15,1)=(-(y(28)*T(11)*T(10)*T(9)*T(7)*T(4)*1/params(7)*getPowerDeriv(T(5),params(22),1)));
g1(15,7)=1/params(5);
g1(15,15)=(-(y(28)*T(11)*T(10)*T(8)*1/params(17)*getPowerDeriv(y(15)/params(17),(-params(20)),1)));
g1(15,20)=(-(y(28)*T(11)*T(8)*T(9)*1/params(16)*getPowerDeriv(y(20)/params(16),(-params(21)),1)));
g1(15,24)=(-(y(28)*T(11)*T(10)*T(9)*T(6)*1/params(50)*getPowerDeriv(y(24)/params(50),(-params(19)),1)));
g1(15,26)=(-(y(28)*T(8)*T(9)*T(10)*1/(1+params(46))*getPowerDeriv((1+y(26))/(1+params(46)),params(37),1)));
g1(15,28)=(-(T(8)*T(9)*T(10)*T(11)));
g1(16,7)=(-1);
g1(16,16)=T(4);
g1(17,7)=(-params(27));
g1(17,13)=(-((-(params(1)*y(24)))/(y(13)*params(1)*y(13)*params(1))));
g1(17,24)=1-1/(y(13)*params(1));
g1(18,23)=(-1);
g1(18,24)=(-1);
g1(18,25)=1;
g1(19,1)=(-1);
g1(19,2)=1;
g1(19,5)=y(14);
g1(19,7)=1-params(27);
g1(19,11)=1;
g1(19,13)=y(24)*(-(params(1)*y(15)))/(y(13)*params(1)*y(13)*params(1));
g1(19,14)=y(5);
g1(19,15)=y(24)*1/(y(13)*params(1));
g1(19,24)=T(2);
g1(20,8)=y(12)/(y(13)*params(1));
g1(20,9)=1;
g1(20,12)=T(1);
g1(20,13)=(-((-(params(1)*y(15)*y(24)))/(y(13)*params(1)*y(13)*params(1))-T(17)+(-(params(1)*y(23)*y(15)))/(y(13)*params(1)*y(13)*params(1))));
g1(20,15)=(-(y(23)/(y(13)*params(1))+y(24)/(y(13)*params(1))));
g1(20,23)=(-T(2));
g1(20,24)=(-T(2));
g1(21,12)=(-(1+params(6)));
g1(21,15)=1;
g1(22,1)=(-(y(29)*T(12)*1/params(7)*getPowerDeriv(T(5),params(24),1)));
g1(22,12)=1/params(13);
g1(22,13)=(-(y(29)*T(13)*1/params(4)*getPowerDeriv(y(13)/params(4),params(23),1)));
g1(22,29)=(-(T(12)*T(13)));
g1(23,5)=(-(params(30)*y(32)*y(14)));
g1(23,8)=(-(params(31)*y(33)*y(12)/(y(13)*params(1))));
g1(23,9)=(-(params(31)*y(33)));
g1(23,10)=(-(params(31)*y(33)));
g1(23,11)=(-(params(31)*y(33)));
g1(23,12)=(-(params(31)*y(33)*T(1)));
g1(23,13)=(-(params(31)*y(33)*T(17)));
g1(23,14)=(-(params(30)*y(32)*y(5)));
g1(23,19)=1;
g1(23,32)=(-(y(5)*params(30)*y(14)));
g1(23,33)=(-(params(31)*(y(8)*y(12)/(y(13)*params(1))+y(10)+y(11)+y(9))));
g1(24,14)=y(22);
g1(24,21)=1;
g1(24,22)=(-(params(26)-y(14)));
g1(25,5)=(-(y(31)*1/params(10)*getPowerDeriv(T(14),params(25),1)));
g1(25,22)=1/params(15);
g1(25,31)=(-T(15));
g1(26,13)=1;
g1(26,21)=(-1);
g1(27,19)=(-(y(30)*y(27)*(params(38)-y(27))*1/(1+y(19))));
g1(27,27)=1-y(30)*(1+log(1+y(19))*(params(38)-y(27))+y(27)*(-log(1+y(19))));
g1(27,30)=(-(y(27)*(1+log(1+y(19))*(params(38)-y(27)))));
g1(28,1)=(-((params(38)-y(27))*(1+params(58))/params(58)*getPowerDeriv(y(1)*(1+params(58))/params(58),params(36),1)));
g1(28,26)=1;
g1(28,27)=T(16);
g1(29,28)=1-exp(x(1))*getPowerDeriv(y(28),params(40),1);
g1(30,29)=1-exp(x(2))*getPowerDeriv(y(29),params(41),1);
g1(31,32)=1-exp(x(3))*getPowerDeriv(y(32),params(42),1);
g1(32,33)=1-exp(x(4))*getPowerDeriv(y(33),params(43),1);
g1(33,31)=1-exp(x(5))*getPowerDeriv(y(31),params(44),1);
g1(34,30)=1-exp((-x(6)))*getPowerDeriv(y(30),params(45),1);
g1(35,2)=(-(100*1/params(8)/(y(2)/params(8))));
g1(35,35)=1;
g1(36,1)=(-(100*1/params(7)/T(5)));
g1(36,36)=1;
g1(37,4)=(-(100*1/params(11)/(y(4)/params(11))));
g1(37,37)=1;
g1(38,3)=(-(100*1/params(12)/(y(3)/params(12))));
g1(38,38)=1;
g1(39,19)=(-(100*1/params(53)/(y(19)/params(53))));
g1(39,46)=1;
g1(40,6)=(-(100*1/params(47)/(y(6)/params(47))));
g1(40,39)=1;
g1(41,7)=(-(100*1/params(48)/(y(7)/params(48))));
g1(41,40)=1;
g1(42,12)=(-100);
g1(42,41)=1;
g1(43,14)=(-100);
g1(43,43)=1;
g1(44,13)=(-100);
g1(44,42)=1;
g1(45,5)=(-(100*1/params(10)/T(14)));
g1(45,44)=1;
g1(46,26)=(-(100*1/(1+y(26))));
g1(46,45)=1;

end
