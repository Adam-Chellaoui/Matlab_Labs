function [VecteurPropre] = VectPropre(A,val)
%   Cette fonction trouve le vecteur propre associée à la valeur propre val

%   Soit X vecteur propre A*X = val*X ^ val!=0 <-> ((1/val)*A -Id)*X = 0
%   F = ((1/val)*A -Id)

F = ((1/val)*A-eye(size(A)));
B = zeros(size(A,1),1);

[VecteurPropre,~] = solveGaussSeidel(F,B,.0001);
end

