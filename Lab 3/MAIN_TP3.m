%----------MAIN DU TP3----------%



%------------Test des méthodes  de détermination des éléments propres sur des matrices de différentes dimensions 
% et comparaison avec la fonction EIG de Matlab.

%----Test sur matrice d'ordre 3
A1=[7,6,3;2,15,4;2,2,9]
%Avec notre méthode
[S_A1,B_A1]=diago(A1)
%Avec celle de Matlab
[V1,D1]=eig(A1)
pause(1)

%----Test sur matrice d'ordre 10
A2=importdata("A2.mat")
%Avec notre méthode
[S_A2,B_A2]=diago(A2)
%Avec celle de Matlab
[V2,D2]=eig(A2)
pause(1)

%----Test sur matrice d'ordre 50
A3=importdata("A3.mat")
%Avec notre méthode
[S_A3,B_A3]=diago(A3)
%Avec celle de Matlab
[V3,D3]=eig(A3)



%------Execution du script Tambour pour les constructions des matrices
% utiles aux tests
Tambour

%------Recherche Des 70 valeurs propres de plus petit module correspondants aux 70 fréquences les plus basses
[SpecInf,BaseInf]=Valp_Petites(A,70);
SpecInf=-1*SpecInf;   %Signe - car on cherche les λ tel que A.U=−λ.U


%------Recherche Des 20 valeurs propres de plus grand module correspondant aux 20 fréquences les plus hautes
[SpecSup,BaseSup]=Valp_Grandes(A,20);
SpecSup=-1*SpecSup;  %Signe - car on cherche les λ tel que A.U=−λ.U


%------Recherche de valeur propre la plus proche de 1.23 en module
Cible=0;  %Initialisation de notre inconnue
a=Val_Proche(1.23,A);
b=Val_Proche(-1.23,A);
if abs(1.23-a)<abs(-1.23-b)  %On évalue qui de a ou de b est celle la plus proche en Module
    Cible=a;
else
    Cible=b;
end
Cible=-1*Cible  %Signe - car on cherche les λ tel que A.U=−λ.U

%------Visualiser les vibrations (vecteurs propres) correspondant à toutes ces valeurs propres

%----Affichage des 20 vibrations les plus hautes-------%
for i=1:20
    AfficheT(BaseSup(:,i))
    pause(0.5)  %Pause pour laisser voir l'utilisateur 
end


%----Affichage des 70 vibrations les plus basses-------%
for i=1:70
    AfficheT(BaseInf(:,i))
    pause(0.5)  %Pause pour laisser voir l'utilisateur 
end


%----Affichage de la vibration liée à valeur propre la plus proche en module de 1.23-------%
surf(reshape(VectPropre(A,Cible),[20,40]))    %Signe - car on cherche les λ tel que A.U=−λ.U


