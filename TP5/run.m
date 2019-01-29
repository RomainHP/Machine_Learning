## SCRIPT DE LANCEMENT DU TP5

## Chargement et preparation des donnees
load WangGlobalDescr/WangSignatures_Octave.mat;

# Ensemble de tests
test = [WangSignaturesCEDD WangSignaturesEdgeHistogram WangSignaturesFCTH WangSignaturesFuzzyColorHistogram WangSignaturesJCD WangSignaturesPHOG];

# Choix d'une image aleatoire
random = randi(1000);
name = ["Wang/" num2str(random) ".jpg"];
img = imread(name);

# Nombre d'images semblables
nb = 6;

tab = indexation(test(random,:), test, nb);


