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
## @deftypefn {} {@var{retval} =} kmean_k (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-10-15

## Lance l'algorithme kmean pour un k de 1 à nb et affiche ensuite la courbe de cout
function kmean_k (nb)
  load td2_d3.txt -ascii
  m = eye(2);
  res = zeros(1,nb);
  ## Calcul de points centraux
  for k = 1:nb
    g = initialize_kmean(td2_d3,k,m);
    [clas,g2] = coalescence(td2_d3,k,m,g);
    ## Calcul du coût pour cette itération
    res(k) = cost(g2,clas,td2_d3,m);
  end
  plot(res);
end
