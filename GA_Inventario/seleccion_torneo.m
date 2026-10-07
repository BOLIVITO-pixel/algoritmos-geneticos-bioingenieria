function [S, fS] = seleccion_torneo(P, f, k, g)
% SELECCION_TORNEO  Seleccion por torneo (minimizacion).
%   Se forman grupos de k individuos al azar (por defecto 4), sin repetir
%   individuos dentro de una misma ronda, y de cada grupo pasan los g
%   mejores (por defecto 2). Se repite hasta reunir la mitad de la poblacion.
%   Un individuo ya elegido no vuelve a competir.
%   P : matriz de individuos;  f : vector de fitness
%   S : individuos seleccionados (n/2 filas);  fS : su fitness

if nargin < 3 || isempty(k), k = 4; end
if nargin < 4 || isempty(g), g = 2; end
g = min(g, k);

n = size(P, 1);
m = floor(n / 2);
elegidos = [];

while numel(elegidos) < m
    disponibles = setdiff(1:n, elegidos);
    disponibles = disponibles(randperm(numel(disponibles)));
    for ini = 1:k:numel(disponibles)
        grupo = disponibles(ini : min(ini + k - 1, numel(disponibles)));
        [~, o] = sort(f(grupo), 'ascend');
        ganadores = grupo(o(1 : min(g, numel(grupo))));
        faltan = m - numel(elegidos);
        elegidos = [elegidos, ganadores(1 : min(faltan, numel(ganadores)))]; %#ok<AGROW>
        if numel(elegidos) >= m, break; end
    end
end

S  = P(elegidos, :);
fS = f(elegidos);
fS = fS(:);
end
