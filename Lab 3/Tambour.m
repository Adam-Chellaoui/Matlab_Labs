T=ones(20,40);
%Bordure de Gauche
for i=1:20
    T(i,1)=0;
end
%Bordure de Droite
for i=1:20
    T(i,40)=0;
end
%Points flexibles du bord du haut
for i=2:20
    T(1,i)=-1;
end
%Bordure du haut
for i=21:39
    T(1,i)=0;
end
%Points flexibles du bord du bas
for i=2:20
    T(20,i)=-1;
end
%Bordure du bas
for i=21:39
    T(20,i)=0;
end

%Carré noir
T(5,10)=0;
T(6,10)=0;
T(7,10)=0;
T(5,11)=0;
T(6,11)=0;
T(7,11)=0;
T(5,12)=0;
T(6,12)=0;
T(7,12)=0;

%---- Construction de la Matrice A representera le Laplacien 
i=1;
A= zeros(800);
while(i<=800)
    if(T(i)==0)
        A(i,i)=1;
    elseif(T(i)==-1)
        if(mod(i,20)==0)
            A(i,i)=-3;
            A(i,i-1)=1;
            A(i,i+20)=1;
            A(i,i-20)=1;
        else
            A(i,i)=-3;
            A(i,i+1)=1;
            A(i,i+20)=1;
            A(i,i-20)=1;
        end
    elseif(i>20 && i<780)
        A(i,i)=-4;
        A(i,i-20)=1;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+20)=1;
    elseif(i<20)
        A(i,i)=-4;
        A(i,780+i)=1;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+20)=1;
    elseif(i>780)
        A(i,i)=-4;
        A(i,i-20)=1;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,800-i)=1;
    end
    i=i+1;
end






