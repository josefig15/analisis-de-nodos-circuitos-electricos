% PROGRMA 1: CONTADOR DE NODOS

disp("Programa 1 CONTADOR NODOS")

L1 = size(matA);  % Dimensiones Mat A en Vector L
L = L1(1);        % Numero de Filas 

Q = 0;            % Contador de Nodods

U = 0;            % Contador Super Nodos Simples
D = 0;            % contador Super Nodos Normales

G = 0;            % Numero Maximo de Super Nodos Normales
H = 0;            % Numero Maximo de Super Nodos Simples

for F = 1:L

  T = matA(F,1);
  M = matA(F,2);
  P = matA(F,3);
  N = matA(F,4);
  
  E = P == N;        % Indocador Dos Nodos Iguales
  Z = P==0 && N==0;  % Indicador Dos Nodos a cero
  I = P!=0 && N==0;  % Indicador Positivo diferente de cero
  J = P==0 && N!=0;  % Indicador Negativo diferente de cero
  K = P!=0 && N!=0;  % Indicador Positivo y Negativo diferente de cero
  
  if E || Z
    disp("Error 1: Positivo Y Negativo Iguales o Ambos a cero"),F
  endif
  
  % Proceso encuentra el nodo mayor
  if P > N
    if P >= Q
      Q = P;  
    endif
  else
    if N >= Q
      Q = N;
    endif
  endif
  
  % Proceso para contar tipos de super nodo
  if T == 3
    if I || J
      U++;
    endif
    
    if K == 1
      D++;
    endif 
  endif 
endfor  
  
disp("Numero de Nodos:"),Q
disp("Numero de SN Simples:"),U
disp("Numero de SN Normales:"),D
  
G = Q - 1 ;
  
if D > G
  disp("Error 2: Exceso de Super Nodos")
endif
  
if (D != 0) && (D <= G)
  H = Q - D;
endif
  
if D == 0
  H = Q;
endif

if U > H
  disp("Error 2: Exceso de Super Nodos")
endif

disp("Numero Max de SN Normales:"),G
disp("Numero Max de SN Simples:"),H
