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
## @deftypefn {Function File} {@var{retval} =} runBayes (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CHARPENTIER ROMAIN <rcharpen@BE11-19-L>
## Created: 2018-11-22

function [res] = runBayes (x, test, nbOracle, nbClasses)
  ## Phase d'entrainement
  moyennes = moyennes(test,nbOracle,nbClasses);
  probabilites = probabilite(test, nbOracle, nbClasses);
  sigma = matrix_variance(test, moyennes, nbOracle, nbClasses);
  ## Lancement de l'algo
  res = decision_bayes(moyennes, sigma, probabilites, x);
endfunction
