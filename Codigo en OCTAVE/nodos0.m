# Matriz De Ingreso de Datos
# Los elementos del circuito se escriben en matriz A
# Cada elemento se escribe en una fila de la matriz A
# El numero de elementos es igual al numero de filas de Matriz A
# Columna 1: Tipo
# Columna 2: Magnitud
# Columna 3: Nodo Positivo
# Columna 4: Nodo Negativo
#
# Tipo 1 -> Resistor
# Tipo 2 -> Fuente de Corriente
# Tipo 3 -> Fuente de Voltaje
#
#       T   MAG N+  N-										
#(1)┌	  1	  R	  R+	R-	┐		
#(2)|	  2	  I	  I+	I-	|	
#(3)|	  3	  V	  V+	V-  |
#(:)|	  -	  -	  -	  -	  |
#(L)└	  -	  -	  -	  -	  ┘

clc
clear

matA = [  1 , 1 , 1 , 0 
          1 , 1 , 2 , 0
          1 , 1 , 3 , 0 
          1 , 1 , 4 , 0  
          1 , 1 , 0 , 1
          1 , 1 , 0 , 2
          1 , 1 , 0 , 3
          1 , 1 , 0 , 4
          
          3 , -1 , 1 , 2
          3 , -1 , 2 , 3
          3 , -1 , 3 , 4
          
          2 , -1 , 0 , 1
          2 , -1 , 0 , 4
		  ]
          
nodos1 % Programa 1 Contador Nodos
nodos2 % Programa 2 Conexiones
nodos3 % Programa 3 Resistores
nodos4 % Programa 4 F.Corriente
nodos5 % Programa 5 F.Voltaje (Super Nodos Simple)
nodos6 % Programa 6 F.Voltaje (Super Nodos Normal)

rref(matC)

nodos7 % Programa 7 Calculo corriente y voltaje resistores

% VISUALIZACION
%lista_elementos = zeros(L,1)
 %for F = 1:L
  %lista_elementos(F) = F;
 %endfor

%matriz2 = [lista_elementos,matB]

 %lista_ecuaciones_y = zeros(Q,1);
 %lista_ecuaciones_x = zeros(1,Q+1);
 
 %for F = 1:Q
   %lista_ecuaciones_y(F) = F;
 %endfor
 
 %for F = 1:Q+1
   %lista_ecuaciones_x(F) = F-1;
 %endfor
 
 %lista_ecuaciones_x
 %matriz3 = [lista_ecuaciones_y, matC]
