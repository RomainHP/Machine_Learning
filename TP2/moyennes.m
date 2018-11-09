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
## @deftypefn {Function File} {@var{retval} =} moyennes (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CHARPENTIER ROMAIN <rcharpen@BE18-03-L>
## Created: 2018-11-08

function [res] = moyennes (points)
  dim = size(points);
  res = zeros(2,3);
  cpt = 1;
  rang = 1;
  for i = 1:dim(2)
    if (cpt > 50)
      rang = rang + 1;
      cpt = 0;
    endif
    res(:,rang) = res(:,rang) + points(:,i);
    cpt = cpt + 1;
  endfor
  for j = 1:3
    res(:,j) = res(:,j)/50;
  endfor
endfunction
