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
## @deftypefn {} {@var{retval} =} apprentissage_simple_bis (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-11-26

## Meme algo mais le poids des synapses vient de l'etat precedent et ajout d'un compteurOk
## On s'arrete si tous les resultats sont ok ou si on a deja fait tourne l'algo cpt fois
function [w] = apprentissage_simple_bis (x, yd, oldW, cpt)
  compteurOk = 0;
  w = oldW;
  ## On regarde pour chaque point si le programme trouve le bon resultat ou non
  for i = 1:size(x)(2)
    y = perceptron_simple(x(:,i),oldW,0);
    if (y==yd(:,i))
      ## Bon resultat
      compteurOk = compteurOk + 1;
    else
      ## Mauvais resultat
      w = w + 0.5*(yd(:,i)-y)*[1 x(1,i) x(2,i)];
    endif
  endfor
  ## Recursivite de l'algorithme si tous les resultats ne sont pas ok et cpt superieur a 0
  if (compteurOk != size(x)(2) && cpt>0)
    #plot(x, (-w(1)/w(3))-(w(2)/w(3))*x);
    w = apprentissage_simple_bis(x, yd, w, cpt-1);
  endif
endfunction
