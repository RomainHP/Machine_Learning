## Copyright (C) 2018 
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
## @deftypefn {Function File} {@var{retval} =} coalescence (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <rcharpen@BE18-06-L>
## Created: 2018-10-09

# Algorithme KMean
function [clas,g2] = coalescence(x,K,M,g)
  dim = size(x);
  clas = 1:dim(2);
  g2 = zeros(2,K);
  g2_nb = zeros(1,K);
  for i = 1:dim(2)
    if K>0
      ## Pour chaque point, on le place dans le groupe dont la distance
      ## avec le point central est minimale
      res = 1;
      norm_min = (g(:,1)-x(:,i))'*M*(g(:,1)-x(:,i));
      for j = 2:K
        norm = (g(:,j)-x(:,i))'*M*(g(:,j)-x(:,i));
        if norm<norm_min
          ## On a trouvé une distance plus petite, donc on remplace le groupe
          res = j;
          norm_min = norm;
        end
      end
      g2(:,res) = g2(:,res) + x(:,i);
      g2_nb(res) = g2_nb(res) + 1;
      clas(i) = res;
    end
  end
  ## Calcul de la moyenne des groupes
  for i = 1:K
    if g2_nb(i)==0
      g2(:,i) = 0; ## Erreur : pas normal
    else
      g2(:,i) = g2(:,i) / g2_nb(i);
    end
  end
  ## Si les points centraux ont bougé, on relance l'algorithme
  if (g2!=g)
    [clas,g2] = coalescence(x,K,M,g2);
  end  
end