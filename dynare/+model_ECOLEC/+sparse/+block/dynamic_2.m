function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  y(48)=y(47)/params(58)*y(74);
  y(51)=y(47)/params(35);
  y(68)=params(15)*(y(51)/params(10))^params(25)*y(77);
  y(55)=y(15)*y(24)/(y(59)*params(1))-y(8)*y(12)/(y(59)*params(1))+y(23)*y(15)/(y(59)*params(1));
  T(1)=(y(59)/params(4))^params(23);
  T(2)=(y(47)/params(7))^params(24);
  y(58)=params(13)*T(1)*T(2)*y(75);
  y(67)=1+y(68)*(params(26)-y(14));
  y(60)=y(14)*(1+y(67)-y(59));
  y(66)=y(60)/params(35);
  y(61)=(1+params(6))*y(58);
  T(3)=(1-(1-params(3))/params(1))*(y(1)/params(7))^params(22)*(y(24)/params(50))^(-params(19));
  T(4)=T(3)*(y(61)/params(17))^(-params(20));
  T(5)=(y(66)/params(16))^(-params(21));
  T(6)=((1+y(26))/(1+params(46)))^params(37);
  y(53)=params(5)*y(74)*T(4)*T(5)*T(6);
  y(52)=y(53)*params(51)/params(5);
  y(57)=y(47)-y(60)*y(51)-y(48)-(1-params(27))*y(53)-y(15)/(y(59)*params(1))*y(24);
  y(56)=y(48)-(1-params(27))*y(52)-y(23)*y(15)/(y(59)*params(1));
  y(50)=(1-params(28))*(1-params(31)*y(79))*(y(57)+y(56)+y(55)+y(8)*y(12)/(y(59)*params(1)));
  T(7)=(1+params(2))*(y(59)/params(14))^(-params(18));
  residual(1)=(1)-(y(66)*T(7));
  residual(2)=(y(47))-(y(60)*y(51)+y(52)+y(50)+y(53)+params(31)*y(79)*(y(8)*y(12)/(y(59)*params(1))+y(56)+y(57)+y(55)));
  T(8)=(-(params(1)*y(15)*y(24)))/(y(59)*params(1)*y(59)*params(1))-(-(y(8)*y(12)*params(1)))/(y(59)*params(1)*y(59)*params(1))+(-(params(1)*y(23)*y(15)))/(y(59)*params(1)*y(59)*params(1));
  T(9)=getPowerDeriv(y(61)/params(17),(-params(20)),1);
  T(10)=getPowerDeriv(y(66)/params(16),(-params(21)),1);
  T(11)=y(14)*(params(26)-y(14))*params(15)*y(77)*getPowerDeriv(y(51)/params(10),params(25),1)*1/params(35)/params(10);
  T(12)=params(5)*y(74)*T(6)*(T(5)*T(3)*T(9)*(1+params(6))*params(13)*y(75)*T(2)*1/params(4)*getPowerDeriv(y(59)/params(4),params(23),1)/params(17)+T(4)*T(10)*(-y(14))/params(35)/params(16));
  T(13)=params(5)*y(74)*T(6)*(T(5)*T(3)*T(9)*(1+params(6))*params(13)*y(75)*T(1)*1/params(7)*getPowerDeriv(y(47)/params(7),params(24),1)/params(17)+T(4)*T(10)*T(11)/params(35)/params(16));
  T(14)=1-(y(51)*T(11)+y(60)*1/params(35))-y(74)*1/params(58)-(1-params(27))*T(13)+y(74)*1/params(58)-(1-params(27))*params(51)*T(13)/params(5);
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=(-(y(66)*(1+params(2))*1/params(14)*getPowerDeriv(y(59)/params(14),(-params(18)),1)+T(7)*(-y(14))/params(35)));
g1_v(2)=(-(y(51)*(-y(14))+params(51)*T(12)/params(5)+T(12)+(1-params(28))*(1-params(31)*y(79))*((-(y(8)*y(12)*params(1)))/(y(59)*params(1)*y(59)*params(1))+T(8)+(-(y(51)*(-y(14))))-(1-params(27))*T(12)-y(24)*(-(params(1)*y(15)))/(y(59)*params(1)*y(59)*params(1))+(-((1-params(27))*params(51)*T(12)/params(5)))-y(23)*(-(params(1)*y(15)))/(y(59)*params(1)*y(59)*params(1)))+params(31)*y(79)*((-(y(8)*y(12)*params(1)))/(y(59)*params(1)*y(59)*params(1))+(-((1-params(27))*params(51)*T(12)/params(5)))-y(23)*(-(params(1)*y(15)))/(y(59)*params(1)*y(59)*params(1))+T(8)+(-(y(51)*(-y(14))))-(1-params(27))*T(12)-y(24)*(-(params(1)*y(15)))/(y(59)*params(1)*y(59)*params(1)))));
g1_v(3)=(-(T(7)*T(11)/params(35)));
g1_v(4)=1-(y(51)*T(11)+y(60)*1/params(35)+params(51)*T(13)/params(5)+T(13)+(1-params(28))*(1-params(31)*y(79))*T(14)+params(31)*y(79)*T(14));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
