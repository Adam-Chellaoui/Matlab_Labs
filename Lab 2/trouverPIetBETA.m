function [PI, BETA] = trouverPIetBETA(A, B,omegaDonne)
    %Cette fonction renvoit les deux matrices PI et BETA correspondantes à
    %la valeur de omega optimale

    %----------- DECOMPOSITION DE A
    D = diagonalElements(A);
    L = lowerElements(A);
    U = upperElements(A);
    
    switch nargin
        case 2
            %----------- BOUCLE POUR DETERMINER L'OMEGA OPTIMAL
            %       Cette boucle n'est actionnée que si omega est donne etant plus
            %       petit que 
            omegaIdeel = 0.01;
            iter = 0;
            rayonIdeel =1;

            for omega = 0.01 : 0.02 : 1.99
                iter = iter+1; % ----- ainsi on pourait avoir une trace sur le nb d'it
                PI = (D +omega*L)\((1-omega)*D-(omega*U)); 
                rayPI = max(abs(eig(PI))); %--- calcul rayon spect de PI
                if(iter ==1 || rayPI<rayonIdeel) % On s'assure d'avoir la bonne valeur pour le rayon à la premiere iteration
                    rayonIdeel = rayPI;
                    omegaIdeel = omega;
                end
            end
        case 3
            omegaIdeel = omegaDonne;
    end


    %----------- CALCUL DE PI DEFINITIF
    PI = (D +omegaIdeel*L)\((1-omegaIdeel)*D-(omegaIdeel*U));
    %----------- CALCUL DE BETA DEFINITF
    BETA = (D + omegaIdeel*L)\(omegaIdeel*B); 
end

