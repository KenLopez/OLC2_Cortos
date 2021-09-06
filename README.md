# Corto # 2
Curso: Organización de Lenguajes y Compiladores 2

Sección: B
| Nombres          | Apellidos     | Carné      |
| :--------------: |:-------------:| :---------:|
| Kenneth Haroldo  | López López   | 201906570  |

## Funcionamiento
* El análisis sintáctico fue realizado con la herramienta Jison, se encuentra en la carpeta `analizador` en el archivo `c3d.jison`.
* Para utilizarlo se debe correr el archivo `index.js`.
* La entrada que se desea analizar debe ser editada en el archivo `index.js` en la asignación de la constante `entrada`.

## Actualizaciones
* Se agregaron operadores comparativos para expresiones.
* Se agregaron operadores lógicos para expresiones.
* Estructuras condicionales If en proceso.

## Ejemplos Utilizados
### Corto 1
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
   var C3D = `--------------------\n${$1.C3D}${$1.LV}:\n${$3.C3D}--------------------\n--LV: ${LV}\n--LF: ${LF}\n--------------------\n`;
   ```
### Corto 2
4. ```
   Entrada: a*c<b+c
   Salida : ----------
            T0 = a * c
            T1 = b + c
            if T0<T1 goto L0
            goto L1
            --LV: L0
            --LF: L1
            ----------
   ```
5. ``` 
   Entrada: not a<b and x!=y
   Salida : --------------------
            ---------------
            ----------
            if a<b goto L0
            goto L1
            --LV: L0
            --LF: L1
            ----------
            --LV: L1
            --LF: L0
            ---------------
            L1:
            ----------
            if x!=y goto L2
            goto L3
            --LV: L2
            --LF: L3
            ----------
            --LV: L2
            --LF: L0,L3
            --------------------       
   ```
6. ```
   Entrada: not a<b and x!=y or not a==c and x>z or a!=b or not x<=y
   Salida : --------------------
            --------------------
            --------------------
            --------------------
            --------------------
            ---------------
            ----------
            if a<b goto L0
            goto L1
            --LV: L0
            --LF: L1
            ----------
            --LV: L1
            --LF: L0
            ---------------
            L1:
            ----------
            if x!=y goto L2
            goto L3
            --LV: L2
            --LF: L3
            ----------
            --LV: L2
            --LF: L0,L3
            --------------------
            L2:
            ---------------
            ----------
            if a==c goto L4
            goto L5
            --LV: L4
            --LF: L5
            ----------
            --LV: L5
            --LF: L4
            ---------------
            --LV: L2,L5
            --LF: L4
            --------------------
            L2,L5:
            ----------
            if x>z goto L6
            goto L7
            --LV: L6
            --LF: L7
            ----------
            --LV: L6
            --LF: L4,L7
            --------------------
            L6:
            ----------
            if a!=b goto L8
            goto L9
            --LV: L8
            --LF: L9
            ----------
            --LV: L6,L8
            --LF: L9
            --------------------
            L6,L8:
            ---------------
            ----------
            if x<=y goto L10
            goto L11
            --LV: L10
            --LF: L11
            ----------
            --LV: L11
            --LF: L10
            ---------------
            --LV: L6,L8,L11
            --LF: L10
            --------------------
   ```