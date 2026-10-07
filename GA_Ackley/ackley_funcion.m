function y = ackley_funcion(x, a, b, c)
% ACKLEY_FUNCION  Funcion Ackley de la guia (ecuacion 6).
%   y = ackley_funcion(x)  evalua la funcion en el vector x de d dimensiones.
%   f(x) = -a*exp(-b*sqrt(mean(x.^2))) - exp(mean(cos(c*x))) + a + 3
%   con a = 20, b = 0.2 y c = 2*pi por defecto. Como se suma 3 en lugar de e,
%   el minimo global esta en x = 0 y vale 3 - e (aprox. 0.2817).

if nargin < 2 || isempty(a), a = 20;     end
if nargin < 3 || isempty(b), b = 0.2;    end
if nargin < 4 || isempty(c), c = 2*pi;   end

x = x(:);
y = -a * exp(-b * sqrt(mean(x.^2))) - exp(mean(cos(c * x))) + a + 3;
end
