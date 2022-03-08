%----Fonction qui renvoie les nb plus grandes valeurs propres en module
%d'une matrice A, et leurs vecteurs propres associés-----

function [SPEC,BASE]=Valp_Petites(A,nb)
n=size(A,1);  %Taille de A
A=inv(A);
SPEC=ones(nb,1);
BASE=ones(n,nb);
for i=1:nb
    [valp,V]=PuissIter(A);
    SPEC(i)=1/valp;
    BASE(:,i)=V;
    U=PuissIter2(A);
    A=Deflation(A,valp,U,V);
end
