function [h1, h2] = cruce_BLX_inventario(p1, p2, alpha)
% CRUCE_BLX_INVENTARIO  Cruce BLX-alfa para el problema de inventarios.
%   Igual al cruce del problema Ackley: para cada gen i de cada hijo
%       h_i = (1 - g)*p1_i + g*p2_i ,   g = (1 + 2*alpha)*u - alpha ,  u ~ U(0,1)
%   con u independiente por gen y por hijo. Despues el hijo se repara
%   (inventario_reparar) para que cumpla los limites y la ecuacion 9.

if nargin < 3 || isempty(alpha), alpha = 0.5; end
n = numel(p1);
g1 = (1 + 2*alpha) * rand(1, n) - alpha;
g2 = (1 + 2*alpha) * rand(1, n) - alpha;
h1 = inventario_reparar((1 - g1) .* p1 + g1 .* p2);
h2 = inventario_reparar((1 - g2) .* p1 + g2 .* p2);
end
