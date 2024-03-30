 % Programas 4 FUENTE CORRIENTE V0_2
 
 disp("Programa 4 F.Corriente")
 
 S = 0;
 
 for F = 1:Q            % Recorre Filas Mat C = Columnas Mat B
   for Y = 1:L          % Recorre Filas Mat B = Filas Mat A   
     
     T = matA(Y,1);     % Tipo
     M = matA(Y,2);     % Magnitud
     P = matA(Y,3);     % Positivo
     N = matA(Y,4);     % Negativo
     X = matB(Y,F);     % Conexion
     
     if T == 2 && X     % Si tipo Fuente de corriente y COnexion fila Mat B
       if P == F        % Cuando Positivo igual fila Mat C ecuacion
         S = M + S;
       endif
       
       if P != F        % Cuando Positivo diferente fila Mat C ecuacion
         S = -M + S;
       endif
     endif
     
   endfor
   
   matC( F , Q + 1 ) = S;
   S = 0;
   
 endfor
 
 % Proceso para Borrar conexiones Resistores
 for F = 1:L            % Recorre Filas Mat A = Filas Mat B  
   
   T = matA(F,1);       % Tipo
   
   P = matA(F,3);       % Positivo
   N = matA(F,4);       % Negativo
   
   if T == 2            % Tipo Fuente Corriente
     
     if P != 0          % Positivo Diferente de Cero
       matB(F,P) = 0;   % Borra Conexion Mat B fila F, Columna Positivo
     endif
     
     if N != 0          % Negativo Diferentede Cero
       matB(F,N) = 0;   % Borra Conexion Mat B fila F, Columna Negativo
     endif
     
   endif
   
 endfor

 disp("Matriz Ecuacion"),matC
 disp("Matriz Conexiones"),matB
