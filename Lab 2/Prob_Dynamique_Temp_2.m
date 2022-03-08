%On repart de la matrice du problème statique, à laquelle on effectue des modifications pour
%la formule du Laplacien
A=importdata("MatriceA_ProbSTatique.mat");

%E contient les incices des points roses par lesquels on injecte la chaleur
E=importdata("pointsRoses.mat");

%Implémentation de la formule du Laplacien pour les cellules roses%
for i = E
        A(i,i)=-4;
        A(i,i+1)=1;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
end


%Implémentation de la formule du Laplacien pour les cellules oranges%

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
for i =[1210,1211,1930,1931,1230,1231,1950,1951]
        A(i,i)=-4;
        A(i,i+1)=1;
        A(i,i-1)=1;
        A(i,i+40)=1;
        A(i,i-40)=1;
end


%------Résolution du Problème 2-------

U=zeros(3200,1);% Au départ : tous les points sont à 0°C
M=expm(A);  %Notre matrice permetant d'incrémenter de Δt=1s

%----On commence à diffuser la chaleur, sans conditions pour l'instant car
%il est normal que tous les points soient à la même température
U=M*U;
for i=E
  U(i)=150;
end
AffichageD(U)

nbIter=1; %Initialisation du garde-fou (on a vient de faire la première itération)

while (abs(max(U)-min(U)) >0.1 && nbIter<5000) %Condition traduisant l'état d'équilibre
    U=M*U;
    for i = E %---On injecte la chaleur à travers les points Roses
        U(i)=150;
    end
    AffichageD(U) %---Affichage à chaque itération de l'état des températures
    nbIter=nbIter+1;
end

DureeEq=nbIter; %Durée pour atteindre l'équilibre en secondes puisque Δt=1s

