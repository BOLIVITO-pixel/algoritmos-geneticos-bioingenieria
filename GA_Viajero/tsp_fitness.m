function t = tsp_fitness(ruta, D, regreso)
% TSP_FITNESS  Tiempo total (minutos) de un recorrido por los 13 lugares.
%   t = tsp_fitness(ruta)            ruta: lista de enteros del 1 al 13
%   t = tsp_fitness(ruta, D)         D: matriz de tiempos (por defecto Tabla I)
%   t = tsp_fitness(ruta, D, regreso) regreso = true suma el trayecto de
%                                    vuelta al primer lugar (por defecto true)
%
% Si la lista no es una permutacion de 1..n, el resultado se penaliza
% sumando 10000 (la suma de todos los tiempos de la tabla es 9534, por lo
% que ningun recorrido invalido puede quedar como optimo).
%
% Ejemplo: tsp_fitness(1:13, [], false) devuelve 641 y
%          tsp_fitness(1:13, [], true)  devuelve 730.

if nargin < 2 || isempty(D),      D = tsp_datos(); end
if nargin < 3 || isempty(regreso), regreso = true;  end

penalizacion = 10000;
n    = size(D, 1);
ruta = ruta(:)';

% Entradas imposibles de evaluar (longitud, rango o valores no enteros)
if numel(ruta) ~= n || any(ruta < 1) || any(ruta > n) || any(ruta ~= round(ruta))
    t = penalizacion;
    return
end

t = sum(D(sub2ind(size(D), ruta(1:end-1), ruta(2:end))));
if regreso
    t = t + D(ruta(end), ruta(1));
end

% Lista con elementos repetidos: no pasa por todos los lugares
if numel(unique(ruta)) ~= n
    t = t + penalizacion;
end
end
