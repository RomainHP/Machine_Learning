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
## @deftypefn {} {@var{retval} =} kmean_file (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-10-11

# Lance l'algo kmean pour un fichier donné avec des points centraux aléatoires
function kmean_file_random (k)
  load td2_d3.txt -ascii
  m = eye(2);
  dim = size(td2_d3)(2);
  ## Calcul de points centraux aléatoires
  g = zeros(2,k);
  for i = 1:k
    val = randi(dim);
    while ismember(td2_d3(:,val),g(:,i))
      val = randi(dim);
    end
    g(:,i) = td2_d3(:,val);
  end
  [clas,g2] = coalescence(td2_d3,k,m,g);
  affiche_classe(td2_d3,clas);
end
