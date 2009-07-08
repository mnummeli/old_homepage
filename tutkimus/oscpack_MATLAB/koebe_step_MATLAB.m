function [w,m]=koebe_step_MATLAB(z,tol)

% usage: [w,m]=koebe_step_MATLAB(z,tol)
%
% Author: Mikko Nummelin, 2007, 2008

	if nargin<1
		error('usage: W=koebe_step_MATLAB(Z,TOL)\n');
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

		% Performs the Koebe transform by 'translating' the minimum
		% point onto the origin by unit-disk automorphism and then
		% performing the holomorphic square root. As we know that
		% if |z|<1, then |sqrt(z)|>|z|, this means that the points
		% in the boundary are transformed slightly nearer the edge
		% of the unit disk, not however landing outside it.
		m=abs(m);
		w=(w+m)./(1+m*w);
		w=holsqrt_MATLAB(w,mindex);
		ms=sqrt(m);
		w=(w-ms)./(1-ms*w);

		% Finally the rotation is reversed for visual effects.
		w=w.*rot';
	end
end
