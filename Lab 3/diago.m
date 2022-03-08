%----Fonction qui renvoie le Spectre d'une matrice A, et les vecteurs
%propres colonnes associés----

function [SPEC,BASE]=diago(A)
n=size(A,1); %Taille de la matrice A
SPEC=ones(n,1);
BASE=ones(n);
for i=1:n
    [valp,V]=PuissIter(A);
    SPEC(i)=valp;
    BASE(:,i)=V;
    U=PuissIter2(A);
    A=Deflation(A,valp,U,V);
end
