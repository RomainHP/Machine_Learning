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
## @deftypefn {Function File} {@var{retval} =} sigma (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CHARPENTIER ROMAIN <rcharpen@BE18-03-L>
## Created: 2018-11-08

function [res] = sigma (points, moyennes)
  res = zeros(2,2,3);
  dim = size(moyennes);
  for i = 1:dim(2)
    for j = 1:dim(2)
      if (i==j)
        res(1,1,i) = variance(points,moyennes,i);
      else
        res(1,1,i) = covariance(points,moyennes,i,j);
      end
    end
    res(1,1,i) = variance();
    res(1,2,i) = variance();
    res(2,1,i) = covariance();
    res(2,2,i) = covariance();
  end
endfunction
