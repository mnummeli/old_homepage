function [w,m]=sinhlog_step_MATLAB(z,tol)

% usage: [w,m]=sinhlog_step_MATLAB(z,tol)
%
% Author: Mikko Nummelin, 2007, 2008

	if nargin<1
		error('usage: W=sinhlog_step_MATLAB(Z,TOL)\n');
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

		% Performs the sinh-log Koebe transform by 'translating'
		% the minimum point onto the origin by unit-disk automorphism,
		% then performing polar coordinate transformations followed
		% by a 'half disk map'. After the following lines, real part of
		% w contains the moduli, imaginary part of w contains argument
		% angles.
		m=abs(m);
		w=(w+m)./(1+m*w);
		w=polarcoord_MATLAB(w,mindex);

		% Calculates necessary data for rotating and adjusting the
		% polar coordinate data into right half of the unit disk.
		high=max(imag(w));
		low=min(imag(w));
		span_angle=high-low;
		tilt_angle=(high+low)/2;

		% Rotates and adjusts the polar coordinate values accordingly
		w=real(w)+i*(imag(w)-tilt_angle);
		w=real(w).^(pi/span_angle)+i*imag(w.*(pi/span_angle));
		oimg=m.^(pi/span_angle)*exp(-i*tilt_angle*pi/span_angle);

		% Transforms back to orthogonal coordinates
		w=real(w).*cos(imag(w))+i*real(w).*sin(imag(w));

		% Right half disk into unit disk
		w=(w.^2+2.*w-1)./(-w.^2+2.*w+1);
		oimg=(oimg^2+2*oimg-1)/(-oimg^2+2*oimg+1);


		% Transform the origin back
		w=(w-oimg)./(1-oimg'*w);

		% Finally the rotation is reversed for visual effects.
		w=w.*rot';
	end
end
