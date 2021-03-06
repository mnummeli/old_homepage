% A simple test program for log-Koebe algorithm implemented in MATLAB.
% Mikko Nummelin, 2008

1;

p=[0,3,2+i,4+2i,.5+2i];
p2=p-(.5+.5i);
[q,v_ind]=adjpolygon_MATLAB(p2,.05);
plot(q,'*');
fprintf('Press any key\n');
pause;

% Scaled into the unit disk
q2=sinhlog_MATLAB(q,0);
plot(q2,'r*',exp(i*[0:pi/100:2*pi]),'k-');
pause;

% One step
q2=sinhlog_MATLAB(q,1);
plot(q2,'r*',exp(i*[0:pi/100:2*pi]),'k-');
pause;

% Twenty steps
q2=sinhlog_MATLAB(q,20);
plot(q2,'r*',exp(i*[0:pi/100:2*pi]),'k-');

% Prints the approximated Schwarz-Christoffel-parameters
imag(log(q2(v_ind)))
