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
## @deftypefn {} {@var{retval} =} apprentissage_simple (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

#w => poits synaptiques apres aprentissage _ vecteur 3 lignes
#x => ensemble d'apprentissage _ matrice 2xn 
#yd => yd(i) indique la reponse desiree pour x(:,i). _ vecteur 1 ligne et n+1 ou n-1 colonnes 

function [w]= apprentissage_simple (x,yd)
  ## Les poids synaptiques sont initialisés aléatoirement
  w = zeros(3);
  for j = 1:3
    w(j) = randint(10);
  endfor
  ## On regarde pour chaque point si le programme trouve le bon résultat ou non
  for i = 1:size(x)(2)
    y = perceptron_simple(x(:,i),w,0);
    if (y==yd(:,i))
      ## Bon résultat
      
    else
      ## Mauvais résultat
      
    endif
  endfor
endfunction
