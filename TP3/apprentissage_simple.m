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
  oldW = zeros(1,3);
  for j = 1:3
    oldW(j) = randi(10);
  endfor
  w = oldW;
  compteurOk = 0;
  ## On regarde pour chaque point si le programme trouve le bon resultat ou non
  for i = 1:size(x)(2)
    y = perceptron_simple(x(:,i),oldW,0);
    if (y==yd(:,i))
      ## Bon resultat
      compteurOk = compteurOk + 1;
    else
      ## Mauvais resultat
      if (y>yd(:,i))
        w(1) = w(1) + 1;
      else
        w(2) = w(2) + 1;
      endif
    endif
  endfor
  ## Recursivite de l'algorithme si tous les resultats ne sont pas ok
  if (compteurOk != size(x)(2))
    w = apprentissage_simple_bis(x, yd, w, 99);
  endif
endfunction
