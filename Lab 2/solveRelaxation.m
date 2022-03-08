function [X, iterations] = solveRelaxation(A, B, precision,omega)
% La fonction prend obligatoirement en param�tres les matrices A et B du
% syst�me AX=B, ainsi que la pr�cision souhait�e. Par ailleurs elle peut
% aussi prendre l'omega utilis� pour trouver les matrices PI et BETA
% utilis�es pour r�soudre le syst�me. Cela a l'int�r�t de reduire la
% complexit� du calcul

% Elle renvoie en sortie la solution "X" et le nombre d'it�rations 
% n�cessaires pour l'atteindre.

% Verif nombre de parametres
switch nargin
    case 3 
        [PI, BETA] = trouverPIetBETA(A,B);
    case 4
        [PI, BETA] = trouverPIetBETA(A,B,omega);
end
X=ones(size(B));

iterations = 0;
while(norm(A*X-B)>precision && iterations<3000)
   sigma = PI*X;
   for i=1 : size(X)
       X(i) = (BETA(i) +  sigma(i));
   end
    iterations = iterations+1;
end

end