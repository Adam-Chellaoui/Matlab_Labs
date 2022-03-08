function [m,n] = decompositionJacobi(a)
%Return M= Matrix with elements on Main Diagonal of a, N = Matrix of the opposite of other elements 

m = diagonalElements(a);
n = m - a;
end

