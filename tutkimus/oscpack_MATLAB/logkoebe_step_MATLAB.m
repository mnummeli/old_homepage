function [w,m]=logkoebe_step_MATLAB(z,tol)

% usage: [w,m]=logkoebe_step_MATLAB(z,tol)
%
% Author: Mikko Nummelin, 2007, 2008

	if nargin<1
		error('usage: W=logkoebe_step_MATLAB(Z,TOL)\n');
	elseif nargin<2
		tol=.99; % default value for tolerance
	end

	[m,mindex]=min(z);
	w=z;

	% The step is accepted only if nearest point from origin is nearer
	% than the tolerance level.
	if abs(m)<tol

		% Finds the angle, how much the Jordan-area should be rotated
		% in order to place the minimum point at the negative real
		% axis and performs such rotation.
		rot=-m'/abs(m);
		w=w.*rot;

		% Performs the logarithmic Koebe transform by 'translating'
		% the minimum point onto the origin by
		% unit-disk automorphism and then
		% performing the holomorphic logarithm.
		m=abs(m);
		w=(w+m)./(1+m*w);
		w=hololog_MATLAB(w,mindex);
		w=w./(-log(m)); % Transforms the critical point onto -1
		w=(1+w)./(1-w);
		w(mindex)=-1;

		% Finally the rotation is reversed for visual effects.
		w=w.*rot';
	end
end
