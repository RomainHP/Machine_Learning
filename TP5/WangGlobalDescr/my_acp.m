function [C,ax,lambda,corx_u,M]=my_acp(varargin)
%Realisation d'une ACP 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Utilisation
%[C,ax,lambda,corx_u]=my_acp(X) ou [C,ax,lambda,corx_u]=my_acp(X,D)
% X : Individus rang�s en colonne
% Dans le cas de l'AFD : X (Individus rang�s en colonne) et D=inv(T)*B 
% Resultat
%C : matrice des coefficients issus de la projection sur les axes calcul�s
%par l'ACP (individus rang�s en colonne)
%ax : axe pricipaux calcul�s par l'ACP (rang�s en colonne)
%Lambda : part d'inertie associ�e � chaque axe (quantit� d'information)
%corx_u : Mesure ressemblance statistique entre les axes factoriels et les
%mesures initiales corx_u(b,bb) : lien statistique entre la mesure b et
%l'axe factoriel bb.
%M : vecteur moyenne indiquant le centre du nouveau rep�re

if (nargin==1)
    X=varargin{1};
n_mesure=size(X,1);
n_ind=size(X,2);

M=mean(X,2);

Xc=X;
%Calcul de la matrice variance covariance totale
for b=1:n_mesure,
   Xc(b,:)=X(b,:)-M(b);
end;

V=Xc*Xc';V=V/n_ind;
else
    Xc=varargin{1};
    V=varargin{2};
    n_mesure=size(Xc,1);
n_ind=size(Xc,2);

end;

[ax,D] = eig(V);
lambda =diag(D);
[lambda,ind]=sort(lambda,'descend');

plot(cumsum(lambda)/sum(lambda));
title('Importance des sous-espaces');
xlabel('Nombre d''axes');
ax_t=ax(:,ind(1:n_mesure));



%Projection des donn�es dans le nouvel espace "ACP"
C=(Xc'*ax_t)';


corx_u=zeros(n_mesure,n_mesure);
for b=1:n_mesure,
   for bb=1:n_mesure,
      corx_u(b,bb)=(Xc(b,:)*C(bb,:)')/(sqrt(Xc(b,:)*Xc(b,:)')*sqrt(C(bb,:)*C(bb,:)'));
   end;
end;
