%----Fonction qui permet l'affichage des ondes du tambour-----
function AffichageD(U) 
F=zeros(20,40);
    for i=1:20
        for j=1:40
            ii=i;
            jj=j;
            F(i,j)= U(20*(j-1)+i); %Changement d'indice
        end
    end
    
    figure(1)
    surf(F)
    axis([0 40 0 20 -1 1]) %On calibre l'affichage suivant les 3 axes
    drawnow                                     
end