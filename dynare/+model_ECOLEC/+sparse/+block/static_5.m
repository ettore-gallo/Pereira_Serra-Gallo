function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(4)=exp(x(4));
  residual(1)=(y(33))-(y(33)^params(43)*T(4));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1-T(4)*getPowerDeriv(y(33),params(43),1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
