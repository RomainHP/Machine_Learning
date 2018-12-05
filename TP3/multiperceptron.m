## Copyright (C) 2018 morga
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} multiperceptron (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

#y =>  scalaire en sortie du neurone
#x => entree du reseau de neurone
#w1 => poids synaptique des 2 neurones de la couche cache _ matrice 3x2
#w2 => poids synaptique du neurone de la couche de sortie _ vecteur 3 lignes

function [y] = multiperceptron (x,w1,w2)
  tabY = ones(1,size(w1)(1));
  for i = 1:size(w1)(1)
     tabY(i) = perceptron_simple(x,w1(i,:),2);
  endfor
  y = perceptron_simple(tabY, w2, 2);
endfunction
