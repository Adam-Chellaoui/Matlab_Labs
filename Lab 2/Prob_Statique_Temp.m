% ------- IMPORT DU SCHEMA DES POINTS
Points = importdata("points.mat");

% ------- CREATION DE B ET AFFECTATION AVEC VALEURES CORRESPONDANTES
B = zeros(3200,1);
i=1;
while(i<=3200)
    B(i)=Points(i);
    i=i+1;
end


% ------- CREATION DE A ET AFFECTATION AVEC VALEURES EN FONCTION DE B

A = zeros(3200);

% Si on connait la temperature de B(i), A(i,i)=1
% Si on ne la connait pas, A(i,i) = -4; A(i,i+/-1) = A(i,i+/-40) = 1
i=1;
while(i<=3200)
    if(B(i)~=0)
        A(i,i)=1;
    elseif(i>40 && i<3160)
        A(i,i)=-4;
        A(i,i-40)=1;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+40)=1;
    elseif(i<40)
        A(i,i)=-4;
        A(i,3160)=1;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+40)=1;
    elseif(i>3160)
        A(i,i)=-4;
        A(i,i-40)=1;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,3200-i)=1;
    end
    i=i+1;
end

%-----RESOLUTION DU PROBLEME STATIQUE-----

% En connaissant à l'avance la valeur d'omega optimale, nous pouvons la
% donner comme parametre de la fonction solveRelaxation, ce qui reduit
% énormement la complexité du calcul

[U,n]=solveRelaxtion(A,B,0.01,1.86);

surf(reshape(U,[40,80])) %Affiche la répartition de la température dans la pièce
