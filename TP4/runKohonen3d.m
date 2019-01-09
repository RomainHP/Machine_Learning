## Copyright (C) 2019 Romain
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
## @deftypefn {} {@var{retval} =} runKohonen3d (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2019-01-09

function runKohonen3d ()
  img = imread("FEMME.ppm");
  x=zeros(3,256*256);
  ind = 1;
  for b = 1:256
    for bb = 1:256
      x(:,ind) = img(b,bb,:);
      ind = ind+1;
    endfor
  endfor
  K = 10;
  mu = 0.5;
  sigma = 3;
  nbiter = 1000;
  w = kohonen3d(x,K,mu,sigma,nbiter);
  affiche_grille(w);
endfunction
