function [S, fS] = seleccion_elitismo(P, f)
% SELECCION_ELITISMO  Toma a la mitad de la poblacion con mejor fitness.
%   P : matriz de individuos (una fila por individuo)
%   f : vector con el fitness de cada individuo (minimizacion)
%   S : individuos seleccionados (n/2 filas);  fS : su fitness
% Sirve para cualquiera de los problemas de optimizacion.

n = size(P, 1);
m = floor(n / 2);
[~, orden] = sort(f(:), 'ascend');      % menor valor = mejor individuo
idx = orden(1:m);
S  = P(idx, :);
fS = f(idx);
fS = fS(:);
end
