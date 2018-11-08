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
## @deftypefn {Function File} {@var{retval} =} decision_bayes (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CHARPENTIER ROMAIN <rcharpen@BE18-03-L>
## Created: 2018-11-08

function [clas] = decision_bayes (m, sigma, p, x)
  C = size(m);
  n = size(x);
  max = 0;
  z=0;
  for i = 1:n(2)
    for j = 1:C(2)
      sig = sigma(:,:,j);
      ## Algorithme de décision (approche gaussienne)
      val = -0.5*(x(i)-m(j))'*sig(:,2)*(x(i)-m(j))-0.5*log(det(sig(:,1)))+log(p(m));
      if (val>max)
        max = val;
        z=j;
      end  
    end
    clas(i) = j;
  end
endfunction
