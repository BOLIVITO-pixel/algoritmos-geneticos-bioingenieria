function [h1, h2] = cruce_BLX(p1, p2, alpha, lim)
% CRUCE_BLX  Cruce por mezcla BLX-alfa para individuos de numeros reales.
%   [h1, h2] = cruce_BLX(p1, p2, alpha, lim)
%   Para cada gen i, cada hijo toma un valor al azar en el intervalo
%       [min_i - alpha*I_i , max_i + alpha*I_i],  I_i = max_i - min_i,
%   donde min_i y max_i son el menor y el mayor valor de los padres en ese gen.
%   Equivale a  h_i = (1-g)*p1_i + g*p2_i  con  g = (1+2*alpha)*u - alpha  y
%   u uniforme en [0,1] (u distinto para cada gen y cada hijo).
%   Despues se limita cada gen al intervalo lim = [min max].
%   Por defecto alpha = 0.5 y lim = [-10 10].

if nargin < 3 || isempty(alpha), alpha = 0.5;     end
if nargin < 4 || isempty(lim),   lim = [-10 10];  end

d = numel(p1);
g1 = (1 + 2*alpha) * rand(1, d) - alpha;
g2 = (1 + 2*alpha) * rand(1, d) - alpha;
h1 = (1 - g1) .* p1(:)' + g1 .* p2(:)';
h2 = (1 - g2) .* p1(:)' + g2 .* p2(:)';
h1 = min(max(h1, lim(1)), lim(2));
h2 = min(max(h2, lim(1)), lim(2));
end
