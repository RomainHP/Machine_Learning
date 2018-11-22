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

function [res] = probabilite (points, moyennes, M)
  dim = size(points);
  dim2 = size(moyennes);
  res = zeros(1,dim(2));
  tab = zeros(1,dim2(2));
  total = 0;
  for j = 1:dim(2)
    for i = 1:dim2(2)
      distance = (points(:,j)-moyennes(:,i))'*M*(points(:,j)-moyennes(:,i));
      tab(i) = distance;
      total = total + distance;
    endfor
    ## Calcul de la probabilité
    for i = 1:dim2(2)
      tab(i) = tab(i) / total;
    endfor
  endfor
endfunction
