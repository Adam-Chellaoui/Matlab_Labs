%-----Fonction qui effectue la méthode de la puissance itérée sur une matrice A à coefficients réels
%---Variables de Sortie----
%valp:Valeur propre de plus grand module
%Y:Vecteur propre colonne associé
function [valp,Y]=PuissIter(A)
Y=ones(size(A,1),1);   
valp=0;  
X=ones(size(A,1),1); 

%Condition  représentant la "qualité de la colinéarité" entre X et Y
while max(abs(Y-valp*X))>0.0001 
    X=Y/norm(Y);  
    Y=A*X;
    [Max,i]=max(abs(X)); %On récupère en i l'indice du max des coefficients en valeur absolue de X, qui est Forcément≠0
    if Y(i)/X(i)>0
        valp=norm(Y)/norm(X);
    else
        valp=-norm(Y)/norm(X);
    end
end

end


   