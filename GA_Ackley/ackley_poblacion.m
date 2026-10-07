function P = ackley_poblacion(n, d, lim)
% ACKLEY_POBLACION  Poblacion inicial para la funcion Ackley.
%   P = ackley_poblacion(n, d, lim)  genera n individuos (filas) de d numeros
%   reales distribuidos uniformemente en el intervalo lim = [min max]
%   (por defecto [-10 10], valores recomendados por la guia).

if nargin < 3 || isempty(lim), lim = [-10 10]; end
P = lim(1) + (lim(2) - lim(1)) * rand(n, d);
end
