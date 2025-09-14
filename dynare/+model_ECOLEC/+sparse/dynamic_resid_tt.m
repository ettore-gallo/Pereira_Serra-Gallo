function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 22
    T = [T; NaN(22 - size(T, 1), 1)];
end
T(1) = y(8)/(y(59)*params(1));
T(2) = (1-params(3))/params(1);
T(3) = y(15)/(y(59)*params(1));
T(4) = (1+params(2))*(y(59)/params(14))^(-params(18));
T(5) = (1-T(2))*(y(1)/params(7))^params(22);
T(6) = (y(24)/params(50))^(-params(19));
T(7) = T(5)*T(6);
T(8) = (y(61)/params(17))^(-params(20));
T(9) = (y(66)/params(16))^(-params(21));
T(10) = ((1+y(26))/(1+params(46)))^params(37);
T(11) = (y(59)/params(4))^params(23);
T(12) = y(47)/params(7);
T(13) = T(12)^params(24);
T(14) = y(51)/params(10);
T(15) = T(14)^params(25);
T(16) = (y(47)*(1+params(58))/params(58))^params(36);
T(17) = y(28)^params(40)*exp(x(1));
T(18) = y(29)^params(41)*exp(x(2));
T(19) = y(32)^params(42)*exp(x(3));
T(20) = y(33)^params(43)*exp(x(4));
T(21) = y(31)^params(44)*exp(x(5));
T(22) = y(30)^params(45);
end
