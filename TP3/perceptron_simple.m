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
## @deftypefn {} {@var{retval} =} perceptron_simple (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

#y => scalaire correspondant a la sortie du neurone
#x => entree du neurone _ Vecteur a 2 lignes
#w => poids synaptiques du neurone _ Vecteur a 3 ligne;
# premiere ligne correspond au seuil
#active => fonction d'activation utilisee; voir sujet

function [y] = perceptron_simple (x,w,active)
  entree = w(2)*x(1) + w(3)*x(2)+ w(1);
  if(active == 0)
    y = sign(entree);
  else
    if (active == 1)
      y = tanh(entree);
    else
      y = 1 / (1 + exp(-entree));
    endif
  endif
endfunction
