## Copyright (C) 2018 THIELEMANN MORGANE
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
## @deftypefn {Function File} {@var{retval} =} runKnn (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: THIELEMANN MORGANE <mthielem@BE18-04-L>
## Created: 2018-11-08

#test => données de l'apprentissage 
#x => x données à classer
#k => nombre de voisins à prendre en compte
#classe des données d'apprentissage
function runKnn (test,x,k,clasapp,oracle)

 oracle =  [ones(1,50) ones(1,50)*2 ones(1,50)*3];
 
 class = decision_knn(test,oracle,k,3,x,eye(2));
 affiche_classe(x,class);
 nb_error = erreur_classif(clasapp,class);
 disp(nb_error);

endfunction
