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
## @deftypefn {Function File} {@var{retval} =} erreur_classif (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CHARPENTIER ROMAIN <rcharpen@BE18-03-L>
## Created: 2018-11-08

function min_diff=erreur_classif(clas,clas2)
  clas=clas(:)';
  clas2=clas2(:)';
  nbre_classe=max(clas2);
  n=length(clas);

  p=perms(1:nbre_classe);
  min_diff=inf;


  for b=1:size(p,1),
     clas_tmp=zeros(1,n);
     for bb=1:nbre_classe,
        clas_tmp=clas_tmp+(clas2==bb)*p(b,bb);
     end;
     mdiff=sum(clas_tmp~=clas);
     if mdiff<min_diff
        min_diff=mdiff;
     end;
  end;