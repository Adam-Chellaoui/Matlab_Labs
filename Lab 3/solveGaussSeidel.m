function [X, iterations] = solveGaussSeidel(A, B, precision)

% upperElements returne une matrice triangulaire inf�rieure de diagonale 
% principale nulle. Les valeures non nulles correspondent � celles de la
% matrice A
N = -(upperElements(A));

% En faisant M = A+N, M est donc une matrice triangulaire sup�rieure 
% dont les valeures non nulles correspondent � celles de la matrice A
M = A + N;
X = ones(size(B));
D = diagonalElements(A);

%L Matrice triangulaire superieure de diagonale nulle et d'�lements non
%nuls correspondant � l'oppos� des inf�rieurs de la matrice M -> Utile pour
%la soustraction des termes "actualis�s"
L = D-M;

iterations =0;
while(norm(A*X-B)>precision && iterations<3000)
   sigma = N*X;
   soustraire = sigma;
   for i=1 : size(X)
       for j=1:i-1
          soustraire(i) = soustraire(i) +  L(i,j)*X(j);
       end
       X(i) = (B(i) +  soustraire(i))/M(i,i);
   end
    iterations = iterations +1;
end

end

