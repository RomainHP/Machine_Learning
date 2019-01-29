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

## INDEXATION

# Nombre d'images semblables
nb = 6;

tab = indexation(x, test, nb);

## FIGURE 2
figure(2);
clf();
hold on;
title('Images les plus proches');
for i = 1:size(tab)
  name = ["Wang/" num2str(tab(i,:)) ".jpg"];
  subplot(2,3,i),imshow(name);
endfor

## CLASSIFICATION

k = 20;
oracle = [ones(1,100) ones(1,100)*2 ones(1,100)*3 ones(1,100)*4 ones(1,100)*5 ones(1,100)*6 ones(1,100)*7  ones(1,100)*8  ones(1,100)*9  ones(1,100)*10];
class = classification(x, test, oracle, 10, k);

className="";

switch class
  case 1
    className="Jungle";
  case 2
    className="Beach";
  case 3
    className="Monuments";
  case 4
    className="Bus";
  case 5
    className="Dinosaurs";
  case 6
    className="Elephants";
  case 7
    className="Flowers";
  case 8
    className="Horses";
  case 9
    className="Mountains";
  case 10
    className="Courses";
  otherwise
    className="!Error!";
end
printf("Classe : %s (%d)\n", className, class);