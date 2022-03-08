function main(A,B,precision)
% ---------------- TESTS --------------------

% Nous nous intéressons à 3 mesures pour les tests : nombre d'itérations,
% temps et precision

% - Vecteurs contenant les nombres d'iteration de chaque méthode pour le
% ième test
iterJacobi=0;
iterGauss=0;
iterRelax=0;

% - Vecteurs contenant la précision pour chaque test
precJacobi=0;
precGauss=0;
precRelax=0;

% - Vecteurs contenant temps d'execution pour chaque test
tempsJacobi=0;
tempsGauss=0;
tempsRelax=0;

% La Matrice X est la solution donnée par MatLab
X = A\B

tic;
[solution ,iterJacobi] = solveJacobi(A,B,precision);
max(solution)
min(solution)
mean(solution)
precJacobi = norm(X-solution);
tempsJacobi = toc;
tic;
[solution ,iterGauss] = solveGaussSeidel(A,B,precision);
max(solution)
min(solution)
mean(solution)
precGauss = norm(X-solution);
tempsGauss=toc;
tic;
[solution ,iterRelax] = solveRelaxation(A,B,precision);
solution
max(solution)
min(solution)
mean(solution)
precRelax = norm(X-solution);
tempsRelax = toc;

%--------- AFFICHAGE DES RESULTATS

% L'affichage des resultats se fera sous forme de Tableau
%   RESULTATS   JACOBI  GAUSS-SEIDEL    RELAXATION
%   TEMPS        xxx        xxx             xxx
%   ITERATIONS   xxx        xxx             xxx
%   PRECISION    xxx        xxx             xxx
%
Resultats = zeros(4,4);

Resultats(2,2) = tempsJacobi;
Resultats(2,3) = tempsGauss;
Resultats(2,4) = tempsRelax;

Resultats(3,2) = iterJacobi;
Resultats(3,3) = iterGauss;
Resultats(3,4) = iterRelax;

Resultats(4,2) = precJacobi;
Resultats(4,3) = precGauss;
Resultats(4,4) = precRelax;

valPlusVite = Resultats(2,2);
valMoinsIterations = Resultats(3,2);
valPlusPrecise = Resultats(4,2);
%----- Variables utilisees pour l'affichage des Analyses
jac = " Jacobi ";
gauss = " Gauss-Seidel ";
relax = " Relaxation ";

plusVite = jac;
plusPrecise = jac;
moinsIterations = jac;

%------ Determination de la méthode la plus vite
if(Resultats(2,3)<valPlusVite)
    plusVite = gauss;
    valPlusVite = Resultats(2,3);
end        
if(Resultats(2,4)<valPlusVite)
    plusVite = relax;
end

%------ Determination de la méthode la plus precise
if(Resultats(3,3)<valMoinsIterations)
    moinsIterations = gauss;
    valMoinsIterations = Resultats(3,3);
end
if(Resultats(3,4)<valMoinsIterations)
    moinsIterations = relax;
end
%------ Determination de la méthode la plus precise
if(Resultats(4,3)<valPlusPrecise)
    plusPrecise = gauss;
    valPlusPrecise = Resultats(3,3);
end
if(Resultats(4,4)<valPlusPrecise)
    plusPrecise = relax;
end        

% ------ Affichage des Résultats ainsi que des analyses
Resultats
plusVite
plusPrecise
moinsIterations



end