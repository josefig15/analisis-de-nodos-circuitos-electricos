# PROGRMA 0_2 INGRESO DATOS AUTOMATICO
# 1) Programa pregunta el numero de Elementos del circuito
# 2) Programa pregunta el numero de Nodos del circuito. (Numero total Nodos - 1)
# 3) Programa crea matriz A "Ingreso" 
# 4) Programa empieza a ingresar automaticamente cada elemento a la matriz.
# 4.1) Pregunta El tipo: 1) Resistor 2)F.Corriente 3)F.Voltaje
# 4.2) Pregunta el valor del elemento.
# 4.3) Pregunta Numero nodo Positivo.
# 4.4) Pregunta Numero nodo Negativo.

input("NUMERO DE ELEMENTOS? ")
L = ans;
input("NUMERO DE NODOS? ")
Q = ans;

matA = zeros(L,4); %Creacion Matriz A "INGRESO"

U = 0;  % Contador Super Nodos Simples.
D = 0;  % Contador Super Nodos Normales.
for F = 1:L
  disp(" ") % Salto de linea.
  disp("ELEMENTO NUMERO")
  disp(F)
  input("TIPO? 1)R 2)I 3)V ?")
  T = ans;
  input("VALOR? ")
  M = ans;
  input("NODO POSITIVO? ")
  P = ans;
  input("NODO NEGATIVO? ")
  N = ans;
  
  % Escribiendo datos matriz
  matA(F,1) = T;
  matA(F,2) = M;
  matA(F,3) = P;
  matA(F,4) = N;
  
  % Banderas
  E = P==N;         % Indicador Nodos Iguales
  Z = P==0 && N==0; % Indicador Nodos a cero.
  I = P!=0 && N==0; % Indicador Nodo Positivo diferente de cero.
  J = P==0 && N!=0; % Indicador Nodo Negativo diferente de cero.
  K = P!=0 && N!=0; % Indicador Ningun Nodo a cero.
  
  if E || Z
    disp("ERROR 1: DOS NODOS A CERO O DOS NODOS IGUALES")
    return
  endif
  
  if T == 3       % Cuando Tipo F.Voltaje
    if I || J     % Tipo Super Nodo Simple.
      U = U + 1;  % Incrementa contador SNS.
    elseif K      % Tipo Super Nodo Normal.
      D = D + 1;  % Incrementa contador SNN.
    endif
  endif
  
endfor

% PROCESO CALCULO PROPIEDADES CIRCUITO
disp("Numero de SN Simples:")
disp(U)
disp("Numero de SN Normales:")
disp(D)

G = Q - 1;      % Numero Maximo SNN (G)

if D > G        % Cuando Numero SNN (D) > Numero Maximo SNN (G)
  disp("ERROR 2: EXCESO FUENTES DE VOLTAJE")
  return
endif

if D!=0 && D<=G % Cuando Numero SNN (D)!=0 AND Numero SNN(D) <= Numero Maximo SNN (G) 
  H = Q - D;    % Numero maximo SNS (H) = Numero Nodos (Q) - Numero SNN (D)
endif

if D == 0       % Cuando Numero SNN (D) = 0
  H = Q;        % Numero Maximo SNS (H) = Numero Nodos (Q)
endif

if U > H        % Cuando Numero SNS (U) > Numero Maximo SNS (H)
  disp("ERROR 2: EXCESO FUENTES DE VOLTAJE")
endif


  

  

