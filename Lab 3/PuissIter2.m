%-----Fonction qui effectue la méthode de la puissance itérée sur une matrice A à coefficients réels
%---Variables de Sortie----
%Y:Vecteur propre ligne associé à la valeur propre de plus grand module
%---Variables internes----
%valp:Valeur propre de plus grand module

function [Y]=PuissIter2(A)
Y=ones(1,size(A,1)); 
valp=0;  
X=ones(1,size(A,1));  
while max(abs(Y-valp*X))>0.001  %Condition  représentant la "qualité de la colinéarité" entre X et Y
    X=Y/norm(Y);
    Y=X*A;
    [Max,i]=max(abs(X));  %On récupère en i l'indice du max des coefficients en valeur absolue de X, qui est Forcément≠0
    if Y(i)/X(i)>0
        valp=norm(Y)/norm(X);
    else
        valp=-norm(Y)/norm(X);
end
end
    