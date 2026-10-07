function ind = mutacion_ackley(ind, sigmaM, lim)
% MUTACION_ACKLEY  Mutacion para la funcion Ackley (ecuaciones 13 y 14).
%   Selecciona al azar un elemento x_i del individuo y le suma un numero
%   aleatorio r ~ N(0, sigmaM^2):  x_i' = x_i + r.
%   Despues verifica que el nuevo valor quede dentro de los limites lim.
%   Por defecto sigmaM = 1 y lim = [-10 10].

if nargin < 2 || isempty(sigmaM), sigmaM = 1;         end
if nargin < 3 || isempty(lim),    lim = [-10 10];     end

i = randi(numel(ind));
ind(i) = ind(i) + sigmaM * randn;
ind(i) = min(max(ind(i), lim(1)), lim(2));
end
