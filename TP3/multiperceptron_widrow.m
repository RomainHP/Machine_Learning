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
  cpt = 0;
  e = zeros(5000);
  ## Boucle tant qu'il y a des erreurs ou qu'on a pas fait 5000 iterations
  while (compteurOk!=size(x)(2) && cpt<5000)
    compteurOk = 0;
    cpt = cpt + 1;
    ## On regarde pour chaque point si le programme trouve le bon resultat ou non
    for i = 1:size(x)(2)
      ## Sortie du multiperceptron
      y = multiperceptron(x(:,i),w1,w2);
      ## Calcul de l'erreur
      err = (yd(:,i) - y) * (-(y - y*y));
      if (y==yd(:,i) || err==0)
        ## Bon resultat
        compteurOk = compteurOk + 1;
      else
        ## Mauvais resultat = recalcul des poids des neurones
        y1 = perceptron_simple(x(:,i),w1(1,:),2);
        w1(1,:) = w1(1,:) - 0.5 * ( (y1 - y1*y1) * (w2(2) * err) ) * [1 x(1,i) x(2,i)];
        
        y2 = perceptron_simple(x(:,i),w1(2,:),2);
        w1(2,:) = w1(2,:) - 0.5 * ( (y2 - y2*y2) * (w2(3) * err) ) * [1 x(1,i) x(2,i)];
        
        w2 = w2 - 0.5 * err * (y - y*y) * [1 y1 y2];
      endif
    endfor
  endwhile
endfunction
