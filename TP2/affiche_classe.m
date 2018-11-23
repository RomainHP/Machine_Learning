
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
## @deftypefn {Function File} {@var{retval} =} affiche_classe (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn


## Author: CHARPENTIER ROMAIN <rcharpen@BE18-03-L>
## Created: 2018-11-08

function affiche_classe(x,clas);
  clf();
  hold on;
  coul=['bx';'gx';'rx';'cx';'mx';'yx';'kx'];
  for b=1:max(clas),
    ind=find(clas==b);
    plot(x(1,ind),x(2,ind),coul(b,:));
  end;

