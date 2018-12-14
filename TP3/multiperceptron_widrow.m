## Copyright (C) 2018 Romain
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
## @deftypefn {} {@var{retval} =} multiperceptron_widrow (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-11-30

function [w1, w2] = multiperceptron_widrow (x, yd)
  ## Les poids synaptiques sont initialisés aléatoirement
  w1 = zeros(2,3);
  w2 = zeros(1,3);
  for i = 1:2
    for j = 1:3
      w1(i,j) = rand(1);
    endfor
  endfor
  for j = 1:3
    w2(j) = rand(1);
  endfor
  compteurOk = 0;
  ## On regarde pour chaque point si le programme trouve le bon resultat ou non
  for i = 1:size(x)(2)
    y = multiperceptron(x(:,i),w1,w2);
    if (y==yd(:,i))
      ## Bon resultat
      compteurOk = compteurOk + 1;
    else
      ## Mauvais resultat
      # formule = diapo 34 du cours
      w1(1,:) = w1(1,:) - 0.5 * ( - (yd(:,i)-y) * [1 x(1,i) x(2,i)] * (1 - y*y));
      w1(2,:) = w1(2,:) - 0.5 * ( - (yd(:,i)-y) * [1 x(1,i) x(2,i)] * (1 - y*y));
      w2 = w2 - 0.5 * ( - (yd(:,i)-y) * [1 x(1,i) x(2,i)] * (1 - y*y));
    endif
  endfor
  ## Recursivite de l'algorithme si tous les resultats ne sont pas ok
  if (compteurOk != size(x)(2))
    [w1, w2] = multiperceptron_widrow_bis(x, yd, w1, w2, 99);
  endif
endfunction
