% INVENTARIO_VERIFICAR_INTEGRAL  Compara la funcion objetivo del problema de
% inventarios (solucion exacta de la integral de la ecuacion 8) con la integral
% numerica, para varios individuos factibles al azar.

clear; clc; rng(1);
par = inventario_datos();
P = inventario_poblacion(5);
for k = 1:size(P, 1)
    x = P(k, :);
    Zi = 0;
    for i = 1:5
        a = x(5 + i) + x(10 + i);
        g = @(t) (t - a) ./ (par.m(i) * sqrt(2*pi) * par.sigma(i)) .* ...
                 exp(-0.5 * ((t - par.mu(i)) / par.sigma(i)).^2);
        Zi = Zi + par.D(i) / x(i) * quadgk(g, a, Inf);
    end
    fprintf('Individuo %d: Z exacta = %.6f | Z numerica = %.6f | diferencia = %.2e\n', ...
            k, inventario_funcion(x), Zi, abs(inventario_funcion(x) - Zi));
    fprintf('             restriccion (ec. 9): sum(Q/2+S) = %.10f (I = %d)\n', sum(x(1:5)/2) + sum(x(6:10)), par.I);
end
