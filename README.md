# Corto # 1
Curso: Organización de Lenguajes y Compiladores 2
| Nombres          | Apellidos     | Carné      |
| :--------------: |:-------------:| :---------:|
| Kenneth Haroldo  | López López   | 201906570  |

## Funcionamiento
* El análisis sintáctico fue realizado con la herramienta Jison, se encuentra en la carpeta `analizador` en el archivo `c3d.jison`.
* Para utilizarlo se debe correr el archivo `index.js`.
* La entrada que se desea analizar debe ser editada en el archivo `index.js` en la asignación de la constante `entrada`.

## Ejemplos Utilizados
1. ```
   Entrada: 5*2+b

   Salida : T0 = 5 * 2 
            T1 = T0 + b
    ```

2. ```
   Entrada: ((x+y)/j*x)-i

   Salida : T0 = x + y 
            T1 = T0 / j
            T2 = T1 * x
            T3 = T2 - i
   ```
3. ``` 
   Entrada: (x+y)/(y*x)+z-j/(y-z)
   Salida : T0 = x + y
            T1 = y * x
            T2 = T0 / T1
            T3 = T2 + z
            T4 = y - z
            T5 = j / T4
            T6 = T3 - T5         
   ```