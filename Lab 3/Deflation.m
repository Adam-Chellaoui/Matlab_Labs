%-----Fonction qui effectue le changement permetant la déflation de Wielandt
function [A]=Deflation(A,lambda,u,v)
A=A-lambda*(v*u)/(u*v);
end

