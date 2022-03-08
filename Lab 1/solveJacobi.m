function [X, iterations] = solveJacobi(A,B,precision)

%Returne la solution avec une précision donnée en paramètre pour l'équation
%matricielle A*X=B et le nombre d'itérations nécessaire pour l'atteindre

X = ones(size(B));
[M,N] = decompositionJacobi(A);
% M = Matrice diagonale, telle que sa diagonale est composée par les 
% élements de la diagonale de A;

% N = M - A -> N = -(A-M)

% --- Etant donné que M est diagonale, inv(M) est elle aussi diagonale et
% ses elements sont obtenus simplement comme les inverses des elements de
% la matrice M.

% On obtient donc la matrice PI = inv(M)*N;
PI = zeros(size(M));

for i=1:size(M)
    PI(i,i)=1/M(i,i); 
    % Comme M est une matrice inversible et diagonale (hypotèse), M(i,i)
    % forcement different de 0.
end
%BETA = inv(M)*B or à ce point PI = inv(M)
BETA = PI*B;

PI = PI*N;
iterations = 0;

while(norm(A*X-B)>precision && iterations<3000)
   X = PI*X; 
   for i=1 : size(X)       
        X(i) = X(i)+BETA(i);
   end
   iterations = iterations+1; 
end

end

