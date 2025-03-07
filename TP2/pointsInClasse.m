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
## @deftypefn {} {@var{retval} =} pointsInClasse (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-11-23

## Retourne le tableau des points correspondant à la classe
function [res] = pointsInClasse (points, oracle, classe)
  nb = 0;
  for i = 1:size(oracle)(2)
    if (oracle(:,i)==classe)
      nb = nb + 1;
    endif
  endfor
  res = zeros(size(points)(1),nb);
  cpt = 1;
  for i = 1:size(oracle)(2)
    if (oracle(:,i)==classe)
      res(:,cpt) = points(:,i);
      cpt = cpt + 1;
    endif
  endfor
endfunction
