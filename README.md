# analisis-de-nodos-circuitos-electricos
Programa que permite encontrar las tensiones en los Nodos de un circuito electrico de corriente directa. 

### INSTRUCCIONES DE USO CALCULADORA TI-83/84:
1) Ingresar todos los elementos que contiene el circuito en la matriz A de la calculadora.
2) Ejecutar el programa "nodos0" (contiene el orden de operacion de cada programa). 
	
### INSTRUCCIONES DE USO OCTAVE:
1) Ingresar todos los elementos que contiene el circuito en la matriz A dentro del script "nodos0.m" 
2) Ejecutar el escript "nodos0.m". (contiene el orden de operacion de cada programa). 

### COMO AJUSTAR EL CIRCUITO:

1) designar un nodo 0 de referencia, este nodo tendra un tension de 0v.
 
2) marcar con un numero todos los demas nodos que no son el nodo de referencia.
 
3) asumir una polaridad cualquiera para los resistores y marcarlos con + el positivo y - para el negativo.
 
4) Para las fuentes de Corriente, el postivo de las fuentes de corriente es la punta de la flecha.
	
5) ingresar todos los elementos que componen el circuito en la matriz A.

### INGRESANDO LOS ELEMENTOS DEL CIRCUITO DENTRO DE MATRIZ A:
		
	MATRIZ A 
    	T  	M	P	N		
	1 ┌	1	R	R+ 	R-	┐	RESISTOR		
	2 |	2	I	I+ 	I-	|	FUENTE INDEPENDIENTE DE CORRIENTE 
	3 |	3	V	V+ 	V- 	|	FUENTE INDEPENDIENTE DE VOLTAJE
	: |	-	-	-	 -	|
	L └ 	-	-	-	 -	┘
		1	 2	3	 4

* Columna 1: T Tipo
* Columna 2: M Magnitud
* Columna 3: P Nodo Positivo
* Columna 4: N Nodo Negativo
	
### Tipos de Elementos

* Tipo T = 1 -> Resistor
* Tipo T = 2 -> Fuente de Corriente Independiente.
* Tipo T = 3 -> Fuente de Voltaje Independiente.
	
Cada fila de la matriz A representa un elemento del circuito.
El numero de filas de la matriz A es igual al numero de elementos del circuito.	

### REGLAS SOBRE EL CONTENIDO DE MATRIZ A:
	- UN ELEMENTO NO PUEDE TENER DOS NODOS CON EL MISMO NUMERO.
	- UN ELEMENTO NO PUEDE TEBER DOS NODOS CONECTADOS A LA REFERENCIA (NODO 0).
	- TENER DOS FUENTES DE CORRIENTE EN SERIE. *
	- TENER DOS FUENTES DE VOLTAJE EN PARALELO.

* El programa no puede detectar dos fuentes de corriente en serie, queda a discresion del usuario no cometer ese error.	

Si una de estas condicones se cumple, el programa lanza un mensaje de error e interrumpe la ejecucion del programa. 	

### MENSAJES DE ERROR:
	Error 1: Un elemento con dos Nodos iguales o un Elemento con dos Nodos a cero.
	Error 2: Exceso de Super Nodos (Fuentes de Voltaje).
