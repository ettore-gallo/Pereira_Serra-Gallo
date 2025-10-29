function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = model_ECOLEC_logG.static_resid_tt(T, y, x, params);
end
residual = zeros(46, 1);
    residual(1) = (y(3)) - ((1-params(30)*y(32))*y(14)*y(5));
    residual(2) = (y(4)) - ((1-params(28))*(1-params(31)*y(33))*(y(11)+y(10)+y(9)+y(8)*y(12)/(y(13)*params(1))));
    residual(3) = (y(8)-T(1)) - (params(28)*(1-params(31)*y(33))*(y(1)-y(14)*y(5)-(1-params(27))*(y(7)+y(6))));
    residual(4) = (y(2)) - (y(1)/params(58)*y(28));
    residual(5) = (y(6)) - (y(7)*params(51)/params(5));
    residual(6) = (y(17)) - (y(6)+y(17)*(1-params(3))/params(1));
    residual(7) = (y(23)-y(23)/(y(13)*params(1))) - (params(27)*y(6));
    residual(8) = (y(10)) - (y(2)-(1-params(27))*y(6)-y(23)*T(2));
    residual(9) = (y(1)) - (y(14)*y(5)+y(6)+y(4)+y(7)+params(31)*y(33)*(y(8)*y(12)/(y(13)*params(1))+y(10)+y(11)+y(9)));
    residual(10) = (y(18)) - (params(35)/params(33));
    residual(11) = (y(34)) - (y(1)/(params(34)*y(16)));
    residual(12) = (y(5)) - (y(1)/params(35));
    residual(13) = (y(20)) - (y(14)/params(35));
    residual(14) = (1) - (y(20)*T(3));
    residual(15) = (y(7)/params(5)) - (y(28)*T(8)*T(9)*T(10)*T(11));
    residual(16) = (y(16)) - (y(7)+(1-params(3))/params(1)*y(16));
    residual(17) = (y(24)-y(24)/(y(13)*params(1))) - (params(27)*y(7));
    residual(18) = (y(25)) - (y(23)+y(24));
    residual(19) = (y(11)) - (y(1)-y(14)*y(5)-y(2)-(1-params(27))*y(7)-T(2)*y(24));
    residual(20) = (y(9)) - (y(15)*y(24)/(y(13)*params(1))-y(8)*y(12)/(y(13)*params(1))+y(23)*y(15)/(y(13)*params(1)));
    residual(21) = (y(15)) - (y(12)*(1+params(6)));
    residual(22) = (y(12)/params(13)) - (T(12)*T(13)*y(29));
    residual(23) = (y(19)) - (params(31)*y(33)*(y(8)*y(12)/(y(13)*params(1))+y(10)+y(11)+y(9))+y(5)*params(30)*y(32)*y(14));
    residual(24) = (y(21)) - (1+y(22)*(params(26)-y(14)));
    residual(25) = (y(22)/params(15)) - (T(15)*y(31));
    residual(26) = (0) - (y(21)-y(13));
    residual(27) = (y(27)) - (y(27)*(1+log(1+y(19))*(params(38)-y(27)))*y(30));
    residual(28) = (y(26)) - ((params(38)-y(27))*T(16));
    residual(29) = (y(28)) - (y(28)^params(40)*exp(x(1)));
    residual(30) = (y(29)) - (y(29)^params(41)*exp(x(2)));
    residual(31) = (y(32)) - (y(32)^params(42)*exp(x(3)));
    residual(32) = (y(33)) - (y(33)^params(43)*exp(x(4)));
    residual(33) = (y(31)) - (y(31)^params(44)*exp(x(5)));
    residual(34) = (y(30)) - (y(30)^params(45)*exp((-x(6))));
    residual(35) = (y(35)) - (log(y(2)/params(8))*100);
    residual(36) = (y(36)) - (100*log(T(5)));
    residual(37) = (y(37)) - (100*log(y(4)/params(11)));
    residual(38) = (y(38)) - (100*log(y(3)/params(12)));
    residual(39) = (y(46)) - (100*log(y(19)/params(53)));
    residual(40) = (y(39)) - (100*log(y(6)/params(47)));
    residual(41) = (y(40)) - (100*log(y(7)/params(48)));
    residual(42) = (y(41)) - (100*(y(12)-params(13)));
    residual(43) = (y(43)) - (100*(y(14)-params(29)));
    residual(44) = (y(42)) - (100*(y(13)-params(4)));
    residual(45) = (y(44)) - (100*log(T(14)));
    residual(46) = (y(45)) - (100*log(1+y(26)));

end
