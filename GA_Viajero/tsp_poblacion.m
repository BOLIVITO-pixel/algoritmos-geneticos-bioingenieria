function P = tsp_poblacion(n, nCiudades)
% TSP_POBLACION  Poblacion inicial para el problema del viajero.
%   P = tsp_poblacion(n)  genera n listas (filas) que son permutaciones
%   aleatorias de los numeros del 1 al 13 (sin elementos repetidos).
%   P = tsp_poblacion(n, nCiudades) permite cambiar el numero de lugares.

if nargin < 2, nCiudades = 13; end
P = zeros(n, nCiudades);
for i = 1:n
    P(i, :) = randperm(nCiudades);
end
end
