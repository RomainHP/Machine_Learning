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
## @deftypefn {} {@var{retval} =} initialize_kmean (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-10-15

## Initialise les points centraux
function [g] = initialize_kmean (points, k, M)
  dim = size(points)(2);
  ## Initilisation
  g = zeros(2,k);
  ## Le premier point est aléatoire
  g(:,1) = points(:,randi(dim));
  poids = zeros(1,dim);
  ## Ensuite on itère pour les autres centres à trouver (jusqu'à k)
  for i = 2:k
    ## Pour chaque points, on cherche le centre le plus proche
    for j = 1:dim
      norm_min = (g(:,1)-points(:,j))'*M*(g(:,1)-points(:,j));
      for l = 2:i
        norm = (g(:,l)-points(:,j))'*M*(g(:,l)-points(:,j));
        if (norm < norm_min)
          norm_min = norm;
        end  
      end
      ## La norme minimale correspond au poids de ce point (pour etre le nouveau centre)
      poids(j) = norm_min;
    end
    ## En fonction du poids, on choisit un point
    tab = zeros(1,dim);
    for j = 1:dim
      tab(j) = j;
    end
    R = randsample(tab, 1, true, poids);
    g(:,i) = points(:,R);
  end
endfunction
