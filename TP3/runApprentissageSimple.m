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
## @deftypefn {} {@var{retval} =} runApprentissageSimple (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: morga <morga@MSI>
## Created: 2018-11-30

function  runApprentissageSimple (x)
  figure(1); 
  clf();
  title("Apprentissage simple");
  hold on;
  xlim([-2 2]);
  ylim([-2 2]);
  oracle = [ones(1,25)*(-1) ones(1,25)];
  active = 1;
  tab = [rand(2,5)-1 ; rand(2,5)-1];
  coul=['bx';'gx';'rx';'cx';'mx';'yx';'kx'];
  ##Â Poids des synapses apres apprentissage
    
  w = apprentissage_simple(x, oracle);
  ## Droite separatrice
  figure(2);
  clf();
  title("Classification de valeurs aléatoires");
  hold on;
  plot(x, (-w(1)/w(3))-(w(2)/w(3))*x);
  for i = 1:size(tab)(2)   
    y = perceptron_simple(tab(:,i),w,active); 
    ## Point avec couleur en fonction de la classe
    plot(tab(1,i),tab(2,i),coul(sign(y)+2),'MarkerSize',20);
  endfor
endfunction
