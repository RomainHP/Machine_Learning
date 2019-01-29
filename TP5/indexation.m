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
## @deftypefn {} {@var{retval} =} indexation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2019-01-29

function [tab] = indexation (x, test, nb)
  tab = zeros(nb,1);
  dimTest = size(test);
  norm = zeros(dimTest(2),1);
  
  #on remplit la matrice des distances
  for i = 1:dimTest(2)
     for j = 1:dimTest(1)
        norm(i,1) = norm(i,1) + (x(j,1)-test(j,i))^2;
     endfor
  endfor
  
  #on trie la matrice norm pour obtenir facilement les k plus proche voisins
  [sortNorm,index] = sort(norm(:,1));
  
  for i = 1:nb
    tab(i,:) = index(i);
  endfor
endfunction
