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
## @deftypefn {Function File} {@var{retval} =} kmean (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <rcharpen@BE18-06-L>
## Created: 2018-10-09

# Lance l'algo kmean
function kmean ()
  nb = 40;
  x = generate_Data(nb);
  k = 2;
  m = eye(2);
  g = [x(1),x(20)];
  [clas,g2] = coalescence(x,k,m,g);
  affiche_classe(x,clas);
  oracle =  [ones(1,nb) ones(1,nb)*2];
  nbre_error = erreur_classif(oracle,clas);
  disp(nbre_error);
end
