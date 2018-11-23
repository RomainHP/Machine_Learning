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

function res = runPerceptronLogique ()
  x = [1.0,0.0,0.0];
  w = [-0.5,1.0,1.0];
  active = 0;
  res = perceptron_simple(x,w,active);
endfunction
