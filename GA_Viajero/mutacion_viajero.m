function ind = mutacion_viajero(ind)
% MUTACION_VIAJERO  Mutacion por intercambio para el problema del viajero.
%   Selecciona al azar dos posiciones distintas del individuo e intercambia
%   sus valores, de modo que sigue siendo una permutacion valida.
%   Ejemplo: [1 2 3 4 5 6] -> [1 5 3 4 2 6] (posiciones 2 y 5).

pos = randperm(numel(ind), 2);
ind([pos(1), pos(2)]) = ind([pos(2), pos(1)]);
end
