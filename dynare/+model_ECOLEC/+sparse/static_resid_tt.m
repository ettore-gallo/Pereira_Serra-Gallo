function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
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
