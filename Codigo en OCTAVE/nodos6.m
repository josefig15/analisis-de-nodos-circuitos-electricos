 # Programa 6 V0.5.2
 # Este programa solo es para verificar el algoritmo de Super Nodos Normales
 # Va de afuera para adentro en la cadena de SN Normales
 
 disp("Programa 6 V0.5.2 Super Nodos Normales")
 
 L3 = zeros(1,L)           % Vector Super Nodos Normales, vacio

 D = 1;
 
 % Bucle Principal
 while  D >= 1
   
   U = 0;                           % 1 Conexion            
   D = 0;                           % 2 Conexion
   Z = 0;                           % 0 Conexion                         
   
   for F = 1:L                      % Recorre Filas Mat A = Filas MAt B
     
    T = matA(F,1);                  % Tipo
    M = matA(F,2);                  % Magnitud
    P = matA(F,3);                  % Positivo
    N = matA(F,4);                  % Negativo
    
    K = P != 0 && N != 0;           % Indicador Positivo y Negativo diferente de Cero
    E = K && L3(F)==0;              % Indicador Super Nodo Normal No Operado
    
    if T == 3 && E                  % Tipo F.Voltaje y Ningun terminal a Cero
      
        G = 0;                      % Puntero fila mat C para LCk SN
        H = 0;                      % Puntero fila mat C para Ecuacion SN
        I = 0;                      % Indicador Concatenamiento Positivo         
        J = 0;                      % Indicador Concatenamiento Negativo
      
        % Proceso para encontrar concatenamiento
        for Y = 1:L                 % Recorre Filas Mat B = Filas Mat A
          if matB(Y,P) && Y != F    % Concatenamiento en Positivo
            I = 1;
          endif
          if matB(Y,N) && Y != F    % Concatenamiento en Negativo
            J = 1;     
          endif 
        endfor
      
        disp("Fila F"),F
        disp("Conexion Positivo"),I
        disp("Conexion Negativo"),J
      
        % Condiciones no Operacion Super Nodo Normal
        if I && J                   % Concatenamiento ambos Nodos (NO OPERACION)
          D = D + 1;
        endif
      
        % Condiciones Operacion Super Nodo Normal
        if I!=1 || J!=1
             
             L3(F) = 1;                       % Indicador Super Nodo Operado
             
             % Cuando no Hay SN simple 
             if L2(P) == 0 && L2(N) == 0     

                  if I && J==0                % Concatenamiento en Positivo
                    U = U + 1; 
                    G = P;
                    H = N;
                  endif
       
                  if I==0 && J                 % Concatenamiento en Negativo
                    U = U + 1;
                    G = N;
                    H = P; 
                  endif
       
                  if I==0 && J==0                 % No Concatenamiento 
                    Z = Z +1; 
                    G = N;
                    H = P;
                  endif
        
             endif % Fin asignacion punteros no super nodo simple
             
             % Cuando Si Hay SN simple 
             if L2(P) || L2(N) 

                if L2(P) && L2(N) == 0        % Cuando Negativo Disponible
                  H = N;
                endif
                
                if L2(P) == 0 && L2(N)        % Cuando Positivo Disponible
                  H = P;
                endif                
                
                L2(H) = 1;                    % Escritura SN simple
             endif % Fin asignacion punteros super nodo simple
             
             % Proceso escritura ecuaciones Super Nodo
             for C = 1:Q+1
               
               if !L2(P) && !L2(N)
                 matC(G,C) = matC(P,C) + matC(N,C); 
               endif
               
               matC(H,C) = 0;
               
               if C == P
                 matC(H,C) = 1;
               endif  
               
               if C == N
                 matC(H,C) = -1;
               endif
               
               if C == Q + 1
                 matC(H,C) = M;
               endif
               
             endfor
             
        endif % fin Condiciones Operacion Super Nodo Normal
        
    endif % fin tipo 3 y habilitador E
    
   endfor
   
   disp("SNN 0 Conexiones"),Z
   disp("SNN 1 Conexiones"),U
   disp("SNN 2 Conexiones"),D
   disp("SNN Operados")
   L3
   % Proceso para borrar conexiones
   for F = 1:L
     
     if L3(F) == 1
       
       P = matA(F,3);
       N = matA(F,4);
       
       if matB(F,P) == 1
         matB(F,P) = 0;
       endif
       
       if matB(F,N) == 1
         matB(F,N) = 0;
       endif
       
     endif
     
   endfor
   disp("Matriz ecuaciones bucle while"),matC
endwhile

disp("Matriz Conexiones"),matB
disp("Matriz ecuaciones"),matC

