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
  clf();
  hold on;
  ## Les poids synaptiques sont initialisés aléatoirement
  w = zeros(1,3);
  for j = 1:3
    w(j) = randi(5);
  endfor
  compteurOk = 0;
  coul=['bx';'gx';'rx';'cx';'mx';'yx';'kx'];
  ## On regarde pour chaque point si le programme trouve le bon resultat ou non
  for i = 1:size(x)(2)
    plot(x(1,i),x(2,i),coul(yd(:,i)+2,:));
    y = perceptron_simple(x(:,i),w,0);
    if (y==yd(:,i))
      ## Bon resultat
      compteurOk = compteurOk + 1;
    else
      ## Mauvais resultat
      w = w + 0.1*(yd(:,i)-y)*[1 x(1,i) x(2,i)];
    endif
  endfor
  plot(x, (-w(1)/w(3))-(w(2)/w(3))*x);
  ## Recursivite de l'algorithme si tous les resultats ne sont pas ok
  if (compteurOk != size(x)(2))
    w = apprentissage_simple_bis(x, yd, w, 99);
  endif
endfunction
