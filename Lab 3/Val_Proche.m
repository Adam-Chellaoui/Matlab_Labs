%----Fonction qui calcule la valeur propre de A la plus proche du complexe c

function [lambda,Y]=Val_Proche(c,A)
n=size(A,1); %Taille de A
A=inv((A-c*eye(n))); %On applique la méthode de la puissance itérée à cette nouvelle matrice
[valp,Y]=PuissIter(A); 
lambda=c+1/valp;