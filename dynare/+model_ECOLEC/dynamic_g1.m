function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = model_ECOLEC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(46, 69);
g1(1,20)=1;
g1(1,22)=(-((1-params(30)*y(49))*y(31)));
g1(1,31)=(-((1-params(30)*y(49))*y(22)));
g1(1,49)=(-(y(22)*y(31)*(-params(30))));
g1(2,21)=1;
g1(2,2)=(-((1-params(28))*(1-params(31)*y(50))*y(3)/(y(30)*params(1))));
g1(2,26)=(-((1-params(28))*(1-params(31)*y(50))));
g1(2,27)=(-((1-params(28))*(1-params(31)*y(50))));
g1(2,28)=(-((1-params(28))*(1-params(31)*y(50))));
g1(2,3)=(-((1-params(28))*(1-params(31)*y(50))*T(1)));
g1(2,30)=(-((1-params(28))*(1-params(31)*y(50))*T(23)));
g1(2,50)=(-((y(28)+y(27)+y(26)+y(2)*y(3)/(y(30)*params(1)))*(1-params(28))*(-params(31))));
g1(3,18)=(-(params(28)*(1-params(31)*y(50))));
g1(3,22)=(-(params(28)*(1-params(31)*y(50))*(-y(31))));
g1(3,23)=(-(params(28)*(1-params(31)*y(50))*(-(1-params(27)))));
g1(3,24)=(-(params(28)*(1-params(31)*y(50))*(-(1-params(27)))));
g1(3,2)=(-(1/(y(30)*params(1))));
g1(3,25)=1;
g1(3,30)=(-((-(y(2)*params(1)))/(y(30)*params(1)*y(30)*params(1))));
g1(3,31)=(-(params(28)*(1-params(31)*y(50))*(-y(22))));
g1(3,50)=(-((y(18)-y(31)*y(22)-(1-params(27))*(y(24)+y(23)))*params(28)*(-params(31))));
g1(4,18)=(-(y(45)*1/params(58)));
g1(4,19)=1;
g1(4,45)=(-(y(18)/params(58)));
g1(5,23)=1;
g1(5,24)=(-(params(51)/params(5)));
g1(6,23)=(-1);
g1(6,7)=(-T(2));
g1(6,34)=1;
g1(7,23)=(-params(27));
g1(7,30)=(-((-(params(1)*y(8)))/(y(30)*params(1)*y(30)*params(1))));
g1(7,8)=(-(1/(y(30)*params(1))));
g1(7,40)=1;
g1(8,19)=(-1);
g1(8,23)=1-params(27);
g1(8,27)=1;
g1(8,30)=y(8)*(-(params(1)*y(5)))/(y(30)*params(1)*y(30)*params(1));
g1(8,5)=y(8)*1/(y(30)*params(1));
g1(8,8)=T(3);
g1(9,18)=1;
g1(9,21)=(-1);
g1(9,22)=(-y(31));
g1(9,23)=(-1);
g1(9,24)=(-1);
g1(9,2)=(-(params(31)*y(50)*y(3)/(y(30)*params(1))));
g1(9,26)=(-(params(31)*y(50)));
g1(9,27)=(-(params(31)*y(50)));
g1(9,28)=(-(params(31)*y(50)));
g1(9,3)=(-(params(31)*y(50)*T(1)));
g1(9,30)=(-(params(31)*y(50)*T(23)));
g1(9,31)=(-y(22));
g1(9,50)=(-(params(31)*(y(2)*y(3)/(y(30)*params(1))+y(27)+y(28)+y(26))));
g1(10,35)=1;
g1(11,18)=(-(1/(params(34)*y(6))));
g1(11,6)=(-((-(y(18)*params(34)))/(params(34)*y(6)*params(34)*y(6))));
g1(11,51)=1;
g1(12,18)=(-(1/params(35)));
g1(12,22)=1;
g1(13,31)=(-(1/params(35)));
g1(13,37)=1;
g1(14,30)=(-(y(37)*(1+params(2))*1/params(14)*getPowerDeriv(y(30)/params(14),(-params(18)),1)));
g1(14,37)=(-T(4));
g1(15,1)=(-(y(45)*T(10)*T(9)*T(8)*T(6)*(1-T(2))*1/params(7)*getPowerDeriv(y(1)/params(7),params(22),1)));
g1(15,24)=1/params(5);
g1(15,32)=(-(y(45)*T(10)*T(9)*T(7)*1/params(17)*getPowerDeriv(y(32)/params(17),(-params(20)),1)));
g1(15,37)=(-(y(45)*T(10)*T(7)*T(8)*1/params(16)*getPowerDeriv(y(37)/params(16),(-params(21)),1)));
g1(15,9)=(-(y(45)*T(10)*T(9)*T(8)*T(5)*1/params(50)*getPowerDeriv(y(9)/params(50),(-params(19)),1)));
g1(15,10)=(-(y(45)*T(7)*T(8)*T(9)*1/(1+params(46))*getPowerDeriv((1+y(10))/(1+params(46)),params(37),1)));
g1(15,45)=(-(T(7)*T(8)*T(9)*T(10)));
g1(16,24)=(-1);
g1(16,6)=(-T(2));
g1(16,33)=1;
g1(17,24)=(-params(27));
g1(17,30)=(-((-(params(1)*y(9)))/(y(30)*params(1)*y(30)*params(1))));
g1(17,9)=(-(1/(y(30)*params(1))));
g1(17,41)=1;
g1(18,40)=(-1);
g1(18,41)=(-1);
g1(18,42)=1;
g1(19,18)=(-1);
g1(19,19)=1;
g1(19,22)=y(31);
g1(19,24)=1-params(27);
g1(19,28)=1;
g1(19,30)=y(9)*(-(params(1)*y(5)))/(y(30)*params(1)*y(30)*params(1));
g1(19,31)=y(22);
g1(19,5)=y(9)*1/(y(30)*params(1));
g1(19,9)=T(3);
g1(20,2)=y(3)/(y(30)*params(1));
g1(20,26)=1;
g1(20,3)=T(1);
g1(20,30)=(-((-(params(1)*y(5)*y(9)))/(y(30)*params(1)*y(30)*params(1))-T(23)+(-(params(1)*y(8)*y(5)))/(y(30)*params(1)*y(30)*params(1))));
g1(20,5)=(-(y(8)/(y(30)*params(1))+y(9)/(y(30)*params(1))));
g1(20,8)=(-T(3));
g1(20,9)=(-T(3));
g1(21,29)=(-(1+params(6)));
g1(21,32)=1;
g1(22,18)=(-(y(46)*T(11)*1/params(7)*getPowerDeriv(T(12),params(24),1)));
g1(22,29)=1/params(13);
g1(22,30)=(-(y(46)*T(13)*1/params(4)*getPowerDeriv(y(30)/params(4),params(23),1)));
g1(22,46)=(-(T(11)*T(13)));
g1(23,22)=(-(params(30)*y(49)*y(31)));
g1(23,2)=(-(params(31)*y(50)*y(3)/(y(30)*params(1))));
g1(23,26)=(-(params(31)*y(50)));
g1(23,27)=(-(params(31)*y(50)));
g1(23,28)=(-(params(31)*y(50)));
g1(23,3)=(-(params(31)*y(50)*T(1)));
g1(23,30)=(-(params(31)*y(50)*T(23)));
g1(23,31)=(-(params(30)*y(49)*y(22)));
g1(23,36)=1;
g1(23,49)=(-(y(22)*params(30)*y(31)));
g1(23,50)=(-(params(31)*(y(2)*y(3)/(y(30)*params(1))+y(27)+y(28)+y(26))));
g1(24,4)=y(39);
g1(24,38)=1;
g1(24,39)=(-(params(26)-y(4)));
g1(25,22)=(-(y(48)*1/params(10)*getPowerDeriv(T(14),params(25),1)));
g1(25,39)=1/params(15);
g1(25,48)=(-T(15));
g1(26,30)=1;
g1(26,4)=(-y(31))/(y(4)*y(4));
g1(26,31)=1/y(4);
g1(26,38)=(-1);
g1(27,36)=(-(y(47)*y(11)*params(59)*(params(38)-y(11))));
g1(27,11)=(-(y(47)*(1+y(36)*params(59)*(params(38)-y(11))+y(11)*(-(y(36)*params(59))))));
g1(27,44)=1;
g1(27,47)=(-(y(11)*(1+y(36)*params(59)*(params(38)-y(11)))));
g1(28,18)=(-((params(38)-y(44))*(1+params(58))/params(58)*getPowerDeriv(y(18)*(1+params(58))/params(58),params(36),1)));
g1(28,43)=1;
g1(28,44)=T(16);
g1(29,12)=(-(exp(x(it_, 1))*getPowerDeriv(y(12),params(40),1)));
g1(29,45)=1;
g1(29,64)=(-T(17));
g1(30,13)=(-(exp(x(it_, 2))*getPowerDeriv(y(13),params(41),1)));
g1(30,46)=1;
g1(30,65)=(-T(18));
g1(31,16)=(-(exp(x(it_, 3))*getPowerDeriv(y(16),params(42),1)));
g1(31,49)=1;
g1(31,66)=(-T(19));
g1(32,17)=(-(exp(x(it_, 4))*getPowerDeriv(y(17),params(43),1)));
g1(32,50)=1;
g1(32,67)=(-T(20));
g1(33,15)=(-(exp(x(it_, 5))*getPowerDeriv(y(15),params(44),1)));
g1(33,48)=1;
g1(33,68)=(-T(21));
g1(34,14)=(-(exp((-x(it_, 6)))*getPowerDeriv(y(14),params(45),1)));
g1(34,47)=1;
g1(34,69)=(-(T(22)*(-exp((-x(it_, 6))))));
g1(35,19)=(-(100*1/params(8)/(y(19)/params(8))));
g1(35,52)=1;
g1(36,18)=(-(100*1/params(7)/T(12)));
g1(36,53)=1;
g1(37,21)=(-(100*1/params(11)/(y(21)/params(11))));
g1(37,54)=1;
g1(38,20)=(-(100*1/params(12)/(y(20)/params(12))));
g1(38,55)=1;
g1(39,36)=(-(100*1/params(53)/(y(36)/params(53))));
g1(39,63)=1;
g1(40,23)=(-(100*1/params(47)/(y(23)/params(47))));
g1(40,56)=1;
g1(41,24)=(-(100*1/params(48)/(y(24)/params(48))));
g1(41,57)=1;
g1(42,29)=(-100);
g1(42,58)=1;
g1(43,31)=(-100);
g1(43,60)=1;
g1(44,30)=(-100);
g1(44,59)=1;
g1(45,22)=(-(100*1/params(10)/T(14)));
g1(45,61)=1;
g1(46,43)=(-(100*1/(1+y(43))));
g1(46,62)=1;

end
