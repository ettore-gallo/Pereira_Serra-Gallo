function [y, T] = static_9(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(41)=100*(y(12)-params(13));
  y(40)=100*log(y(7)/params(48));
  y(39)=100*log(y(6)/params(47));
  y(46)=100*log(y(19)/params(53));
  y(43)=100*(y(14)-params(29));
  y(42)=100*(y(13)-params(4));
  y(44)=100*log(y(5)/params(10));
  y(45)=100*log(1+y(26));
  y(3)=(1-params(30)*y(32))*y(14)*y(5);
  y(38)=100*log(y(3)/params(12));
  y(37)=100*log(y(4)/params(11));
  y(36)=100*log(y(1)/params(7));
  y(35)=log(y(2)/params(8))*100;
end
