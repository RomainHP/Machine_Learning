## Copyright (C) 2018 Romain
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
## @deftypefn {} {@var{retval} =} matrix_variance (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Romain <romain@Romain-PC>
## Created: 2018-11-23

## Calcul de des matrices variance/covariance pour chaque classe (retour dans hypermatrix)
function [res] = matrix_variance (test, moyennes, nbOracle, C)
  res = zeros(2,2,C);
  points = zeros(2,50);
  rang = 1;
  cpt = 1;
  ## Pour la classe i
  for i = 1:C
    cpt=1;
    while (cpt<=nbOracle)
      points(:,cpt) = test(:,rang);
      cpt++;
      rang++;
    endwhile
    ## Pour la ligne j
    for j = 1:2
      ## Pour la colonne k
      for k = 1:2
        if (j==k)
          ## Variance
          res(k,j,i) = variance(points,moyennes,j,i);
        else
          ## Covariance
          res(k,j,i) = covariance(points,moyennes,1,2,i);
        endif
      endfor
    endfor
  endfor
endfunction
