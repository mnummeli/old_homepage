function [q,v]=adjpolygon_MATLAB(p,tol)

% usage: [Q,V]=adjpolygon_MATLAB(P,TOL)
%
% P is a list of complex numbers forming a counterclockwise-oriented polygon.
% This function repeatedly checks whether an edge forms an angle of less than
% TOL. If so, then an edge is split in half in Q to lessen the seriosity of
% this condition. The iteration stops when the polygon does not need to be
% altered anymore. List V consists of new vertice indices corresponding to
% original vertices in P.
%
% Author: Mikko Nummelin, 2007, 2008

	if nargin<1
		error('usage: W=adjpolygon_MATLAB(P,TOL)\n');
	else if nargin<2
		tol=.1; % default value for tolerance
	end

	qtmp=[p,p(1)]; % to make the array circular
	changes_made=true; % to enter the loop at least once

	while changes_made==true
		changes_made=false;
		q=qtmp(1);
		for k=1:length(qtmp)-1

			% Checks whether an edge in polygon forms an
			% angle exceeding the tolerance condition. If yes,
			% then a vertice is added to split the edge in half.
			if abs(imag(log(qtmp(k+1)/qtmp(k))))>tol
				av=(qtmp(k)+qtmp(k+1))/2;
				q=[q,av,qtmp(k+1)];
				changes_made=true;
			else
				q=[q,qtmp(k+1)];
			end
		end
		qtmp=q;
	end
	q=q(1:length(q)-1); % chops away the last value

	% Searches for indices of vertices in q corresponding to original
	% vertices in p.
	v=zeros(1,length(p));
	for k=1:length(p)
		v(k)=find(q-p(k)==0);
	end
end
