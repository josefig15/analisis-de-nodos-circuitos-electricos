 % Prgorama 3 RESISTORES V0_2
 disp("Programa 3 RESISTORES")
 
 S = 0;
 
 for F = 1:Q   % Fila Mat C
   for C = 1:Q  % Columna Mat C = Columna Mat B
     for Y = 1:L  % Filas Mat B = Filas Mat A
       
       T = matA(Y,1);  % Tipo
       M = matA(Y,2);  % Magnitud
       X = matB(Y,C);  % Conexion

       if T == 1 && X
    
         if F == C 
           S = M^-1 + S;
         endif
         
         if F != C && matB(Y,F) == 1
           S = -M^-1 + S;
         endif  
   
       endif 
       
     endfor
     matC(F,C) = S;
     S = 0;
   endfor
   
 endfor
 
 % Proceso para Borrar conexiones Resistores
 for F = 1:L
   
   T = matA(F,1);         % Tipo
   
   P = matA(F,3);         % Positivo
   N = matA(F,4);         % Negativo
   
   if T == 1              % Tipo Resistor
     
     if P != 0            % Positivo Diferente de Cero        
       matB(F,P) = 0;     % Borra Conexion Mat B fila F, Columna Positivo
     endif
     
     if N != 0            % Negativo Diferente de Cero
       matB(F,N) = 0;     % Borra Conexion Mat B fila F, Columna Positivo
     endif
     
   endif
   
 endfor

 disp("Matriz Ecuacion"),matC
 disp("Matriz Conexiones"),matB
 [matA,matB]