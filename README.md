# Algoritmos genéticos – Bioingeniería, Unidad 3

Código MATLAB del informe *Algoritmo genético aplicado a los problemas del viajero, de la función Ackley y de inventarios* (Bioingeniería, Universidad Católica de Oriente, 2026).

**Autor:** Sebastian Dario Bolivar Bolivar – sebastian.bolivar4308@uco.net.co

Los tres problemas usan el mismo esquema de algoritmo genético: población de 60 individuos, selección de la mitad (elitismo, torneo o ruleta), apareamiento al azar, dos hijos por pareja, mutación con probabilidad `Pm` y nueva población formada por los padres seleccionados y sus hijos. Cambian el cruce, la mutación y, en inventarios, la reparación.

| Carpeta | Problema | Cruce | Mutación |
|---|---|---|---|
| `GA_Viajero` | Problema del viajero, 13 lugares del oriente antioqueño | OX1 | Intercambio de dos posiciones |
| `GA_Ackley` | Minimización de la función Ackley (d dimensiones) | BLX-α (α = 0,5) | Gaussiana sobre un gen |
| `GA_Inventario` | Inventarios: 15 variables (Q, S, K) y restricción de igualdad | BLX-α (α = 0,5) + reparación | Gaussiana sobre un gen + reparación |
| `resultados` | CSV de los estudios ejecutados (30 pruebas por escenario) | | |

## Cómo ejecutar

Abra la carpeta del problema en MATLAB (los archivos de cada carpeta se llaman entre sí) y ejecute:

- Un ejemplo: `ejemplo_viajero`, `ejemplo_ackley` o `ejemplo_inventario`.
- Los estudios, en orden: `estudio1_seleccion_*`, `estudio2_iteraciones_*`, `estudio3_mutacion_*` (y `estudio4_dimensiones_ackley` para Ackley). Cada uno genera un CSV. En los estudios 2 y 3 hay líneas marcadas `CAMBIAR` para fijar el método y las iteraciones elegidos en el estudio anterior.
- Verificaciones: `optimo_exacto_viajero` (óptimo del viajero por programación dinámica, Held–Karp) e `inventario_verificar_integral` (compara la forma exacta de la función objetivo de inventarios con la integral numérica).

Las semillas del generador de números aleatorios están fijadas en cada estudio, por lo que los resultados son reproducibles en la misma versión de MATLAB.
