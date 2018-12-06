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
## @deftypefn {} {@var{retval} =} multiperceptron_widrow_bis (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-12-05

function [w1, w2] = multiperceptron_widrow_bis (x, yd, w1, w2, cpt)
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
      w1(1,:) = w1(1,:) - 0.5 * ( - (yd(:,i)-y) * [1 x(1,i) x(2,i)] * (y - y*y));
      w1(2,:) = w1(2,:) - 0.5 * ( - (yd(:,i)-y) * [1 x(1,i) x(2,i)] * (y - y*y));
      w2 = w2 - 0.5 * ( - (yd(:,i)-y) * [1 x(1,i) x(2,i)] * (y - y*y));
    endif
  endfor
  ## Recursivite de l'algorithme si tous les resultats ne sont pas ok et cpt superieur a 0
  if (compteurOk != size(x)(2) && cpt>0)
    [w1, w2] = multiperceptron_widrow_bis(x, yd, w1, w2, cpt-1);
  endif
endfunction
