## Copyright (C) 2019 Romain
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
## @deftypefn {} {@var{retval} =} classification (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2019-01-29

function [class] = classification (x, test, oracle, nbClass, k)
  class = 0;
  dimTest = size(test);
  norm = zeros(dimTest(2),1);
  
  #on remplit la matrice des distances
  for i = 1:dimTest(2)
     for j = 1:dimTest(1)
        norm(i,1) = norm(i,1) + (x(j,1)-test(j,i))^2;
     endfor
  endfor
  
  #on trie la matrice norm pour obtenir facilement les k plus proche voisins
  [sortNorm,index] = sort(norm);
  
  #sortNorm est le nouveau tableau trie
  #index indique comment ont ete rearrange les valeurs
  
  #on va creer un nouveau tableau de classe avec les classes des k plus proches voisins
  classNeighboor = zeros(k,1);
  for l = 1:k   
    classNeighboor(l,1) = oracle(1,index(l,1));
  endfor
  
  #On va regarder sur les k plus proche voisins quelle classe est majoritaire
  classTest = zeros(nbClass,1);
  
  for g = 1:k 
    #compte le nombre de points qui ont la meme classe que lui
    classTest(classNeighboor(g,1),1)++;
  endfor
  
  [mmax,imax]= max(classTest(:,1));
  class = imax;
endfunction
