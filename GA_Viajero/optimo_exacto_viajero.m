function [mejorRuta, mejorT] = optimo_exacto_viajero(D, regreso)
% OPTIMO_EXACTO_VIAJERO  Optimo exacto del TSP por programacion dinamica
% (algoritmo de Held-Karp). Sirve para verificar lo encontrado por el AG.
%   [mejorRuta, mejorT] = optimo_exacto_viajero(D, regreso)
% La ruta siempre sale del lugar 1 (UCO). regreso=true incluye volver a 1.
if nargin < 1, D = tsp_datos(); end
if nargin < 2, regreso = true; end
n = size(D, 1);
m = n - 1;                       % lugares 2..n (indices 1..m)
C = inf(2^m, m);                 % C(S,j): minimo tiempo saliendo de 1, visitando
P = zeros(2^m, m);               % el subconjunto S y terminando en j
for j = 1:m
    C(2^(j-1), j) = D(1, j+1);   % S = {j}
end
for S = 1:2^m - 1
    for j = 1:m
        if ~bitand(S, 2^(j-1)), continue; end
        if S == 2^(j-1), continue; end
        Sp = S - 2^(j-1);
        for k = 1:m
            if bitand(Sp, 2^(k-1)) && C(Sp, k) + D(k+1, j+1) < C(S, j)
                C(S, j) = C(Sp, k) + D(k+1, j+1);
                P(S, j) = k;
            end
        end
    end
end
S = 2^m - 1;
mejorT = inf; fin = 0;
for j = 1:m
    t = C(S, j);
    if regreso, t = t + D(j+1, 1); end
    if t < mejorT, mejorT = t; fin = j; end
end
ruta = zeros(1, n); ruta(1) = 1;
for pos = n:-1:2
    ruta(pos) = fin + 1;
    k = P(S, fin);
    S = S - 2^(fin-1);
    fin = k;
end
mejorRuta = ruta;
end
