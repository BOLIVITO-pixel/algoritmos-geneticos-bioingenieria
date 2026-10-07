function [S, fS] = seleccion_ruleta(P, f)
% SELECCION_RULETA  Seleccion por ruleta para problemas de minimizacion.
%   La probabilidad de elegir al individuo i es inversamente proporcional a
%   su fitness (ecuacion 12 de la guia):
%         p_i = (1/f_i) / sum_j (1/f_j)
%   Se gira la ruleta hasta reunir la mitad de la poblacion; cada individuo
%   elegido sale de la ruleta (no se repite) y las probabilidades se
%   renormalizan en cada giro.
%   Requiere fitness estrictamente positivo.

f = f(:)';
if any(f <= 0)
    error('seleccion_ruleta: el fitness debe ser mayor que cero.');
end

n = size(P, 1);
m = floor(n / 2);
w = 1 ./ f;
disponible = true(1, n);
elegidos = zeros(1, m);

for j = 1:m
    p = w .* disponible;
    p = p / sum(p);
    c = cumsum(p);
    i = find(rand <= c, 1, 'first');
    if isempty(i)                       % por redondeo numerico
        i = find(disponible, 1, 'last');
    end
    elegidos(j) = i;
    disponible(i) = false;
end

S  = P(elegidos, :);
fS = f(elegidos);
fS = fS(:);
end
