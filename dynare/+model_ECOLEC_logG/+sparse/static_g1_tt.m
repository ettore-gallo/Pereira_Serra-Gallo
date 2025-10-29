function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = model_ECOLEC_logG.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 17
    T = [T; NaN(17 - size(T, 1), 1)];
end
T(17) = (-(y(8)*y(12)*params(1)))/(y(13)*params(1)*y(13)*params(1));
end
