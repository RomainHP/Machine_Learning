


function [clas] = decision_knn (test,classe_origine,k,x)
  dimTest = size(test);
  dimX = size(x); # dim(1) = ligne dim2 = colonne
  clas = 1:dimX(2);
  norm = zeros(dimTest(2),dimX(2));
  m = eye(2);
  
  #on rempli la matrice des distances
  for i=1:dimTest(1)
     for j=1:dimX(2)
        norm(i,j) = (x(:,j)-test(:,i))'*m*(x(:,1)-x(:,i));
     endfor
  endfor
  
  #on trie la matrice norm pour obtenir facilement les k plus proche voisins
  [sortNorm,index] = sort(norm);
  
  #sortNorm est le nouveau tableau trié
  #index indique comment on été réarrangé les valeurs
  
  classNeighboor = zeros(k,dimX(2));
  #on va créer un nouveau tableau de classe avec les classes des k plus proches voisins
  for l=1:k
    for z=1:dimX(2)
      classNeighboor(l,z) = classe_origine(index(l));
    endfor
  endfor
  
  #On va regarder sur les k plus proche voisins quelle classe est majoritaire
  classTest = zeros(k,dimX(2));
  for m=1:k
    for y=1:dimX(2)
     #compte le nombre de points qui ont la meme classe que lui
      classTest(m,y) = sum(classNeighboor(l) == classNeighboor(m,y));
    endfor  
  endfor
  dim  =size(clas);
  for n=1:dim(2)
    clas(:,n)=max(classTest(:,n));
  endfor
endfunction
