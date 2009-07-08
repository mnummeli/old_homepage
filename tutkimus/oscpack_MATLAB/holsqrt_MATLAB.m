function w=holsqrt_MATLAB(z,k)

% usage: W=holsqrt_MATLAB(Z,K)
%
% Z is a list of complex numbers approximating a Jordan curve,
% K is the index of first member (usually this member has value of zero)
% which is taken to the holomorphic square root.
%
% Author: Mikko Nummelin, 2007, 2008
%
% BUGS:   NEVER use this in GNU Octave or in any 'production environment'
%         This implementation is for algorithmic clarification only and
%         EXTREMELY INEFFICIENT in interpreted systems. Use dynamic
%         extension versions instead.

	if nargin<1
		error('usage: W=holsqrt_MATLAB(Z,K)\n');
	elseif nargin<2
		k=1;
	end

	% Resulting array
	w=zeros(1,length(z));

	% The first member of holomorphic square root should be the value of
	% complex square root nearest to -i.
	p=-i;
	if k<length(z)
		k1=k+1;
	else
		k1=1;
	end

	while k1~=k
		s=sqrt(z(k1));

		% Chooses the next value of square root so that it is the
		% alternative located nearest of previous value of hol.
		% square root.
		if abs(s-p)>abs(s+p)
			w(k1)=-s;
			p=-s;
		else
			w(k1)=s;
			p=s;
		end

		% Increments the index, but wraps around to 1 at the end of
		% the array.
		if k1<length(z)
			k1=k1+1;
		else
			k1=1;
		end
	end
end
