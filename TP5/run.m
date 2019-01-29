## SCRIPT DE LANCEMENT DU TP5

## Chargement et preparation des donnees
load WangGlobalDescr/WangSignatures_ACP.mat;

# Ensemble de tests
test = [WangSignaturesJCD_ACP ; WangSignaturesFuzzyColorHistogram_ACP ; WangSignaturesCEDD_ACP ; WangSignaturesEdgeHistogram_ACP ; WangSignaturesFCTH_ACP ; WangSignaturesPHOG_ACP];

# Choix d'une image aleatoire
random = randi(1000);
x = test(:, random);
name = ["Wang/" num2str(random) ".jpg"];
randomImg = imread(name);

## FIGURE 1
figure(1);
clf();
hold on;
title('Image de depart');

imshow(randomImg);

%# Nombre d'images semblables
%nb = 6;
%
%tab = indexation(x, test, nb);
%
%## FIGURE 2
%figure(2);
%clf();
%hold on;
%title('Images les plus proches');
%for i = 1:size(tab)
%  name = ["Wang/" num2str(tab(i,:)) ".jpg"];
%  subplot(2,3,i),imshow(name);
%endfor

oracle = [ones(100) ones(100)*2 ones(100)*3 ones(100)*4 ones(100)*5 ones(100)*6 ones(100)*7  ones(100)*8  ones(100)*9  ones(100)*10];
class = classification(x, test, oracle, 10, 10);

printf("Classe : %d\n", class);