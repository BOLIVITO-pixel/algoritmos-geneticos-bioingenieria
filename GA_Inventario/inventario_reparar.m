function x = inventario_reparar(x)
% INVENTARIO_REPARAR  Devuelve un individuo factible a partir de uno cualquiera.
%   1. S_i y K_i se llevan a sus limites [0, Smax_i] y [0, Kmax_i] (ecs. 10-11).
%   2. Con los S_i fijos, el dinero disponible para pedidos es
%          B = I - sum(S_i)          (siempre > 0, porque sum(Smax) < I).
%   3. Los Q_i se hacen positivos y se reescalan proporcionalmente para que
%          sum(Q_i)/2 = B,
%      es decir, para que se cumpla exactamente la ecuacion 9.
%   El individuo reparado nunca se descarta: se corrige y se conserva.

par = inventario_datos();
Q = x(1:5); S = x(6:10); K = x(11:15);
S = min(max(S, 0), par.Smax);
K = min(max(K, 0), par.Kmax);
B = par.I - sum(S);
Q = min(max(Q, par.Qmin), par.Qmax);
Q = Q * (2 * B / sum(Q));
x = [Q, S, K];
end
