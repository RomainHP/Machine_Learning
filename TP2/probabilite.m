## Copyright (C) 2018 CHARPENTIER ROMAIN
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
## @deftypefn {Function File} {@var{retval} =} probabilite (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CHARPENTIER ROMAIN <rcharpen@BE18-03-L>
## Created: 2018-11-08

## Calcul de la probabilite a priori de chaque classe
function [res] = probabilite (points, oracle, nbClasses)
  nb = size(points)(2);
  res = zeros(nbClasses);
  for j = 1:nb
    res(oracle(j)) = res(oracle(j)) + 1;
  endfor
  for i = 1:nbClasses
    res(i) = res(i) / nb;
  endfor
endfunction
