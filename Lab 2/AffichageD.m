%----Fonction qui permet l'affichage dynamique-----
function AffichageD(U) 
F=zeros(40,80);
    for i=1:40
        for j=1:80
            ii=i;
            jj=j;
            F(i,j)= U(40*(j-1)+i); %Changement d'indice
        end
    end
    
    figure(1)
    surf(F)
    axis([0 80 0 40 0 150]) %On calibre l'affichage suivant les 3 axes
    drawnow                                     
end