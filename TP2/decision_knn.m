## Copyright (C) 2018 THIELEMANN MORGANE
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} runKnn (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: THIELEMANN MORGANE <mthielem@BE18-04-L>
## Created: 2018-11-08

function [clas] = decision_knn (test,classe_origine,k,nbClass,x,m)
  dimTest = size(test);
  dimX = size(x); # dim(1) = ligne dim2 = colonne
  clas = 1:dimX(2);
  norm = zeros(dimTest(2),dimX(2));
  
  #on remplit la matrice des distances
  for i = 1:dimTest(2)
     for j = 1:dimX(2)
        norm(i,j) = (x(:,j)-test(:,i))'*m*(x(:,j)-test(:,i));
     endfor
  endfor
  
  #on trie la matrice norm pour obtenir facilement les k plus proche voisins
  [sortNorm,index] = sort(norm);
  
  #sortNorm est le nouveau tableau trie
  #index indique comment on ete rearange les valeurs
  
  classNeighboor = zeros(k,dimX(2));
  #on va creer un nouveau tableau de classe avec les classes des k plus proches voisins
  
  for z = 1:dimX(2)
    for l = 1:k   
      classNeighboor(l,z) = classe_origine(index(l,z));
    endfor
  endfor
  #On va regarder sur les k plus proche voisins quelle classe est majoritaire
  
  classTest = zeros(nbClass,dimX(2));
  
  for y = 1:dimX(2)
    for g = 1:k 
      #compte le nombre de points qui ont la meme classe que lui
      classTest(classNeighboor(g,y),y)++;
    endfor
  endfor  
  
  dim = size(clas);
  for n = 1:dim(2)
    [mmax,imax]= max(classTest(:,n));
    clas(:,n) = imax;
  endfor
endfunction
