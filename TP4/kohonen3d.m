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
## @deftypefn {} {@var{retval} =} kohonen3d (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2019-01-09

function [w] = kohonen3d(x,K,mu,sigma,nbiter)
  N = size(x)(2);
  w = zeros(K,K,K,3);
  for i = 1:K
    for j = 1:K
      for k = 1:K
        w(i,j,k,1) = rand(1);
        w(i,j,k,2) = rand(1);
        w(i,j,k,3) = rand(1);
      endfor
    endfor
  endfor
  mut = mu;
  sigmat = sigma;
  for i = 1:nbiter
    individuAuHasard = randi(N);
    q = ones(1,3);  ## index du composant gagnant
    for j = 1:K
      for k = 1:K
        for h = 1:K
          d = norm(x(:,individuAuHasard) - [w(j,k,h,1) ; w(j,k,h,2) ; w(j,k,h,3)]);
          if (j==1 && k==1)
            dmin = d;
          else
            if (d < dmin)
              dmin = d;
              q = [j k h];
            endif
          endif 
        endfor
      endfor
    endfor
    for j = 1:K
      for k = 1:K
        for h = 1:K
          d = norm(q - [j k h]);
          h = mut * exp(-(d*d)/(2*sigmat*sigmat));
          w(j,k,h,1) = w(j,k,h,1) + h * (x(1,individuAuHasard) - w(j,k,h,1));
          w(j,k,h,2) = w(j,k,h,2) + h * (x(2,individuAuHasard) - w(j,k,h,2));
          w(j,k,h,3) = w(j,k,h,3) + h * (x(2,individuAuHasard) - w(j,k,h,3));
        endfor
      endfor
    endfor
    ## mu et sigma decroissent
    mut = mu + (i/(nbiter-1)) * (0.1-mu);
    sigmat = sigma + (i/(nbiter-1)) * (0.1-sigma);
  endfor
endfunction