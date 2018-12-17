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
## @deftypefn {} {@var{retval} =} runPerceptronLogique (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: morga <morga@MSI>
## Created: 2018-11-23

function runPerceptronLogique ()
  clf();
  hold on;
  x = [0.0 0.0 1.0 1.0 ; 0.0 1.0 0.0 1.0];
  w = [-0.5 1.0 1.0];
  active = 0;
  for i=1:size(x)(2) 
    res = perceptron_simple(x(:,i),w,active);
    if (res==-1)
      plot(x(1,i),x(2,i),'rx','MarkerSize',20);
    else
      plot(x(1,i),x(2,i),'bx','MarkerSize',20);
    endif
  endfor
  plot(x, (-w(1)/w(3))-(w(2)/w(3))*x);
endfunction
