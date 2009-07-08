function w=polarcoord_MATLAB(z,k)

% usage: W=polarcoord_MATLAB(Z,K)
%
% Z is a list of complex numbers approximating a Jordan curve,
% K is the index of first member (usually this member has value of zero)
% which is mapped to zero and holomorphic logarithm is taken from the
% latter values. The real part is then overrided with the modulus.
%
% Author: Mikko Nummelin, 2007, 2008
%
% BUGS:   NEVER use this in GNU Octave or in any 'production environment'
%         This implementation is for algorithmic clarification only and
%         EXTREMELY INEFFICIENT in interpreted systems. Use dynamic
%         extension versions instead.

	if nargin<1
		error('usage: W=polarcoord_MATLAB(Z,K)\n');
	elseif nargin<2
		k=1;
	end

	% Resulting array
	w=zeros(1,length(z));

	% The first member of holomorphic logarithm should be the value of
	% complex logarithm nearest to -i from zeroth branch.
	p=-i;
	if k<length(z)
		k1=k+1;
	else
		k1=1;
	end

	branch=0;
	while k1~=k
		s=log(z(k1))+2*i*pi*branch;

		% Chooses the next value of logarithm so that it is the
		% alternative located nearest of previous value of hol.
		% logarithm.
		if abs(s+2*i*pi-p) < abs(s-p) % Increase the branch
			w(k1)=s+2*i*pi;
			branch=branch+1;
		else if abs(s-2*i*pi-p) < abs(s-p) % Decrease the branch
			w(k1)=s-2*i*pi;
			branch=branch-1;
		else	% Default is to keep the branch intact
			w(k1)=s;
		end

		% Overrides the real part with the modulus!
		w(k1)=abs(z(k1))+i*imag(w(k1));
		p=w(k1);

		% Increments the index, but wraps around to 1 at the end of
		% the array.
		if k1<length(z)
			k1=k1+1;
		else
			k1=1;
		end
	end
end
