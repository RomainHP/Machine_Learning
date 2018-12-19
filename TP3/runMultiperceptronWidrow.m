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
## @deftypefn {} {@var{retval} =} runMultiperceptronWidrow (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-12-05

function runMultiperceptronWidrow ()
  x=[0 1 0 1; 0 0 1 1];
  ## FIGURE 1
  figure(1);
  clf();
  hold on;
  oracle = [0 1 1 0];
  tab = [0 1 0 1; 0 0 1 1];
  coul=['bx';'gx';'rx';'cx';'mx';'yx';'kx'];
  title('Apprentissage avec Widrow');
  ## Poids des synapses apres apprentissage
  [w1, w2] = multiperceptron_widrow(x, oracle);
  ## Droite separatrice
  #plot(x, (-w(1)/w(3))-(w(2)/w(3))*x);
  for i = 1:size(x)(2)
    y = multiperceptron(x(:,i),w1,w2); 
    ## Point avec couleur en fonction de la classe
    plot(x(1,i),x(2,i),coul(sign(y-0.5)+2),'MarkerSize',20);
  endfor
  ## FIGURE 2
  figure(2);
  clf();
  hold on;
  title('Classification de valeurs aleatoires');
  ## Droite separatrice
  plot(x, (-w1(1,1)/w1(1,3))-(w1(1,2)/w1(1,3))*x,'g');
  plot(x, (-w1(2,1)/w1(2,3))-(w1(2,2)/w1(2,3))*x,'b');
  #plot(x, (-w2(1)/w2(3))-(w2(2)/w2(3))*x,'r');
  for i = 1:size(tab)(2)
    y = multiperceptron(tab(:,i),w1,w2);
    disp(y);
    ## Point avec couleur en fonction de la classe
    plot(tab(1,i),tab(2,i),coul(sign(y-0.5)+2),'MarkerSize',20);
  endfor
endfunction
