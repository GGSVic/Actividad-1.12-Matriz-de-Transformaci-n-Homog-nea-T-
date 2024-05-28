%Victor Manuel
%Segundo ejercicio
%Limpieza de pantalla
clear all
close all
clc

%Calculamos las matrices de transformación homogénea
H0=SE3; %Punto de origen
H1=SE3(rotx(pi/2), [0 0 2]); 
H2=SE3(rotz(pi/2), [0 2 0]);
H3=SE3(rotz(-pi/2),[0 -1 0]); 

rotate = (rotx(pi/2));  % Rotacion extra para el sistema

H4=SE3(rotz(pi/2)*rotate, [2 0 0]) ; 
H5=SE3([0 0 1]) ; 

H20= H1*H2;
H30= H20*H3;  %Matriz de transformación homogenea global de 3 a 0 
H40= H30*H4; 
H50= H40*H5; 

%Coordenadas de la estructura de translación y rotación
x=[4 0 0];
y=[0 0 0];
z=[4 4 0];

plot3(x, y, z,'LineWidth', 1.5); axis([-1 5 -1 5 -1 5]); grid on;
hold on;

%Graficamos la trama absoluta o global 
trplot(H0,'rgb','axis', [-1 5 -1 5 -1 5])
% 
% %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H0, H1,'rgb','axis', [-1 5 -1 5 -1 5])

% %Realizamos una animación para la siguiente trama
 pause;
 tranimate(H1, H20,'rgb','axis', [-1 5 -1 5 -1 5])

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H20, H30,'rgb','axis', [-1 5 -1 5 -1 5])
  disp(H30)

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H30, H40,'rgb','axis', [-1 5 -1 5 -1 5])
  disp(H40)

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H40, H50,'rgb','axis', [-1 5 -1 5 -1 5])
  disp(H50)