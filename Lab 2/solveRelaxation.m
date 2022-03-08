function [X, iterations] = solveRelaxation(A, B, precision,omega)
% La fonction prend obligatoirement en paramètres les matrices A et B du
% système AX=B, ainsi que la précision souhaitée. Par ailleurs elle peut
% aussi prendre l'omega utilisé pour trouver les matrices PI et BETA
% utilisées pour résoudre le système. Cela a l'intérêt de reduire la
% complexité du calcul

% Elle renvoie en sortie la solution "X" et le nombre d'itérations 
% nécessaires pour l'atteindre.

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