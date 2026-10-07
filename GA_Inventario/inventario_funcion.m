function Z = inventario_funcion(X)
% INVENTARIO_FUNCION  Funcion objetivo del problema de inventarios (ecuacion 8).
%   Z = inventario_funcion(X)
%   X es un vector fila de 15 valores [Q1..Q5, S1..S5, K1..K5], o una matriz con
%   un individuo por fila. Z es el numero esperado de ventas no atendidas.
%
%   La integral de la ecuacion 8,
%       Z_i = D_i/Q_i * Int_{a}^{inf} (x-a)/(m_i*sqrt(2*pi)*sigma_i) *
%                       exp(-0.5*((x-mu_i)/sigma_i)^2) dx ,   a = S_i + K_i,
%   se resuelve de forma exacta con el cambio u = (x-mu_i)/sigma_i:
%       Z_i = D_i/(Q_i*m_i) * sigma_i * [ phi(z) - z*(1 - Phi(z)) ],
%       z = (a - mu_i)/sigma_i,
%   donde phi y Phi son la densidad y la distribucion de la normal estandar.
%   (inventario_verificar_integral compara este resultado con la integral
%   numerica.)

par = inventario_datos();
Q = X(:, 1:5);
S = X(:, 6:10);
K = X(:, 11:15);
n = size(X, 1);

a = S + K;
z = (a - repmat(par.mu, n, 1)) ./ repmat(par.sigma, n, 1);
phi = exp(-0.5 * z.^2) / sqrt(2 * pi);
cola = 0.5 * erfc(z / sqrt(2));                 % 1 - Phi(z)
integral_i = repmat(par.sigma, n, 1) .* (phi - z .* cola);
Zi = repmat(par.D, n, 1) ./ (Q .* repmat(par.m, n, 1)) .* integral_i;
Z = sum(Zi, 2);
end
