function [h1, h2] = cruce_OX1(p1, p2)
% CRUCE_OX1  Cruce por orden (Order Crossover, OX1) para permutaciones.
%   [h1, h2] = cruce_OX1(p1, p2) genera dos hijos a partir de dos padres que
%   son permutaciones. Procedimiento para cada hijo:
%     1. Se eligen al azar dos puntos de corte c1 < c2.
%     2. El tramo entre los cortes se copia del primer padre.
%     3. Las posiciones restantes se llenan, desde la posicion siguiente a c2
%        y de forma circular, con las ciudades del otro padre en el orden en
%        que aparecen (empezando tambien despues de c2) y omitiendo las que
%        ya estan en el tramo copiado.
%   El segundo hijo se obtiene intercambiando los papeles de los padres.
%   Los hijos siempre son permutaciones validas.

n   = numel(p1);
pts = sort(randperm(n, 2));
c1  = pts(1);
c2  = pts(2);

h1 = ox1_hijo(p1, p2, c1, c2);
h2 = ox1_hijo(p2, p1, c1, c2);
end

function h = ox1_hijo(a, b, c1, c2)
n = numel(a);
h = zeros(1, n);
h(c1:c2) = a(c1:c2);                         % tramo heredado de 'a'
orden = b([c2+1:n, 1:c2]);                   % orden de 'b' tras el 2do corte
orden = orden(~ismember(orden, h(c1:c2)));   % se descartan los ya copiados
pos   = [c2+1:n, 1:c1-1];                    % posiciones libres, circulares
h(pos) = orden;
end
