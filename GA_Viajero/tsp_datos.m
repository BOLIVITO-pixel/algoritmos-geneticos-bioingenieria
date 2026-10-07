function [D, nombres] = tsp_datos()
% TSP_DATOS  Matriz de tiempos de desplazamiento (minutos) entre la UCO y
% los municipios del altiplano del oriente antioqueno (Tabla I de la guia).
%   D(i,j) = tiempo de ir del lugar i al lugar j. La matriz NO es simetrica.
%   Orden: 1 UCO, 2 Rionegro, 3 La Ceja, 4 El Carmen, 5 Marinilla, 6 Guarne,
%   7 El Retiro, 8 Santuario, 9 La Union, 10 San Vicente, 11 Cocorna,
%   12 El Penol, 13 Guatape.

nombres = {'UCO','Rionegro','La Ceja','El Carmen','Marinilla','Guarne', ...
           'El Retiro','Santuario','La Union','San Vicente','Cocorna', ...
           'El Penol','Guatape'};

D = [  0  10  35  29  16  30  40  27  56  44  67  54  81;
       6   0  32  31  16  32  34  28  52  44  63  56  83;
      34  32   0  29  45  58  35  57  26  73  91  83 110;
      29  29  28   0  32  47  57  31  49  61  67  70  99;
      18  18  46  33   0  23  52  19  68  39  54  41  69;
      30  30  58  46  25   0  46  36  79  39  71  62  90;
      40  37  36  59  52  54   0  64  61  80 104  89 117;
      32  32  57  32  18  36  65   0  82  50  41  51  82;
      55  52  23  48  67  80  56  73   0  95 116 101 130;
      47  47  76  62  42  37  73  53  97   0 102  81 111;
      79  79 106  80  66  87 110  59 148 101   0  97 100;
      59  59  86  74  44  65  90  55 107  80  93   0  29;
      89  89 116 104  74  96 119  86 137 110 103  33   0];
end
