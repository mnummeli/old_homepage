% A simple test program for Koebe algorithm implemented in MATLAB.
% Mikko Nummelin, 2008

1;

p=[0,3,2+i,4+2i,.5+2i];
p2=p-(.5+.5i);
[q,v_ind]=adjpolygon_MATLAB(p2,.05);
plot(q,'*');
fprintf('Press any key\n');
pause;

q2=koebe_MATLAB(q,50);
plot(q2,'r*',exp(i*[0:pi/100:2*pi]),'k-');

% Prints the approximated Schwarz-Christoffel-parameters
imag(log(q2(v_ind)))
