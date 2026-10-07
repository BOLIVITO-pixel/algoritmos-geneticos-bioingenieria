function ind = mutacion_inventario(ind, sigmaRel)
% MUTACION_INVENTARIO  Mutacion gaussiana de un gen del individuo.
%   Se elige un gen al azar entre los 15 y se le suma un numero normal con
%   desviacion estandar  sigmaRel * (rango del gen), de modo que sigmaRel es
%   comparable entre Q, S y K (que tienen escalas muy distintas). El rango de
%   Q_i es (0, 2*I), el de S_i es [0, Smax_i] y el de K_i es [0, Kmax_i].
%   Luego el individuo se repara para cumplir limites y ecuacion 9.

par = inventario_datos();
rango = [par.Qmax * ones(1, 5), par.Smax, par.Kmax];
j = randi(15);
ind(j) = ind(j) + sigmaRel * rango(j) * randn;
ind = inventario_reparar(ind);
end
