## Copyright (C) 2018 
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
## @deftypefn {Function File} {@var{retval} =} generate_Data (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <rcharpen@BE18-06-L>
## Created: 2018-10-09

# Genere le tableau de donnees pour l'algo kmean
function [x] = generate_Data (nb);
  x1=[randn(1,nb)+4;randn(1,nb)+4];
  x2=[randn(1,nb)*2-4;randn(1,nb)*2-4];
  x=[x1 x2];
end;
