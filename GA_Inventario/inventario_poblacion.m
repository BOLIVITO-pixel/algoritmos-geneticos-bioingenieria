function P = inventario_poblacion(n)
% INVENTARIO_POBLACION  Poblacion inicial para el problema de inventarios.
%   P = inventario_poblacion(n) devuelve una matriz de n x 15; cada fila es un
%   individuo [Q1..Q5, S1..S5, K1..K5] que cumple la restriccion de la ecuacion 9
%       sum( Q_i/2 + S_i ) = I      y los limites de la Tabla II.
%
%   Se generan 14 valores libres y el valor 15 se calcula con la ecuacion 9:
%     - S_i y K_i (10 valores) al azar dentro de sus limites;
%     - 4 valores de Q al azar, que equivalen a 4 puntos de corte uniformes en
%       (0, 2*(I - sum S)); el quinto Q es lo que falta para cumplir la
%       ecuacion 9 (siempre es positivo). Asi los 5 Q son positivos y suman
%       exactamente 2*(I - sum S), y el orden de los items no importa.

par = inventario_datos();
P = zeros(n, 15);
for k = 1:n
    S = par.Smax .* rand(1, 5);
    K = par.Kmax .* rand(1, 5);
    B = par.I - sum(S);                  % presupuesto que queda para sum(Q/2)
    cortes = sort(2 * B * rand(1, 4));   % 4 valores libres
    Q = diff([0, cortes, 2 * B]);        % el quinto se calcula con la ecuacion 9
    Q = max(Q, par.Qmin);
    Q = Q * (2 * B / sum(Q));
    P(k, :) = [Q, S, K];
end
end
