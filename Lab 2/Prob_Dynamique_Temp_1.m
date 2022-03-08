%On repart de la matrice du problème statique, à laquelle on effectue des modifications
%pour la formule du Laplacien
A=importdata("MatriceA_ProbSTatique.mat");

%On part à l'instant t = 0 de la répartition de températures solution 
%du problème de la partie précédente
U=importdata("VecteurSolutionProbStatique.mat"); 

%E contient les incices des points roses
E=importdata("pointsRoses.mat");

%----Implémentation de la formule du Laplacien pour les cellules roses%
for i=E  
        A(i,i)=-4;
        A(i,i+1)=1;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
end

%----Implémentation de la formule du Laplacien pour les cellules oranges%

%Ligne du haut main%
i=41;
while i<=3121
        A(i,i)=-3;
        A(i,i+1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
        i=i+40;
end

%Ligne du bas main%
i=80;
while i<=3160
        A(i,i)=-3;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
        i=i+40;
end

%Cas particuliers des coins oranges%
A(1,1)=-3;
A(1,2)=1;
A(1,41)=1;
A(1,3161)=1;

A(40,40)=-3;
A(40,39)=1;
A(40,80)=1;
A(40,3200)=1;

A(3161,3161)=-3;
A(3161,1)=1;
A(3161,3162)=1;
A(3161,3121)=1;

A(3200,3200)=-3;
A(3200,3199)=1;
A(3200,40)=1;
A(3200,3160)=1;

%Bande du haut main%
i=1250;
while i<=1890
        A(i,i)=-3;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
        i=i+40;
end

i=1251;
while i<=1891
        A(i,i)=-3;
        A(i,i+1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
        i=i+40;
end

%Bande du bas main%
i=1270;
while i<=1910
        A(i,i)=-3;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
        i=i+40;
end

i=1271;
while i<=1911
        A(i,i)=-3;
        A(i,i+1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
        i=i+40;
end

%Cas partuliers : coins des bandes oranges%
for i =[1210,1211,1930,1931,1230,1231,1950,1951];
        A(i,i)=-4;
        A(i,i+1)=1;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
end

%------Résolution du Problème 1-------

M=expm(A);  %Notre matrice permetant d'incrémenter de Δt=1s
nbIter=0; %Initialisation du garde-fou

while (abs(max(U)-min(U))>0.1 && nbIter<5000) %Condition traduisant l'état d'équilibre
    U=M*U;
    nbIter=nbIter+1; 
    AffichageD(U) %Affichage à chaque Itération de la répartition des températures
end

DureeEq=nbIter; %Durée pour atteindre l'équilibre en secondes puisque Δt=1s

        
       
    




