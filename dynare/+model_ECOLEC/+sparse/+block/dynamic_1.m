function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(64)=params(35)/params(33);
  y(74)=y(28)^params(40)*exp(x(1));
  y(75)=y(29)^params(41)*exp(x(2));
  y(78)=y(32)^params(42)*exp(x(3));
  y(79)=y(33)^params(43)*exp(x(4));
  y(77)=y(31)^params(44)*exp(x(5));
  y(76)=y(30)^params(45)*exp((-x(6)));
end
