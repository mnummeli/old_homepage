function w=koebe_MATLAB(z, rounds, tol)

% usage: w=koebe_MATLAB(z, rounds, tol)
%
% Author: Mikko Nummelin, 2007, 2008

	if nargin<1
		error('usage: W=koebe_MATLAB(Z,ROUNDS,TOL)\n');
	elseif nargin<2
		rounds=100; % default rounds
		tol=.99; % default value for tolerance
	elseif nargin<3
		tol=.99;
	end

	% Scales the Jordan-area into the unit disk.
	[m,mindex]=max(z);
	w=z./abs(m);

	for k=1:rounds
		[w,m]=koebe_step_MATLAB(w,tol);
		if abs(m)>=tol
			break;
		end
	end
end
