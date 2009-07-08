% OSCULATION ALGORITHMS TEST
% ==========================
%
% A test comparing three different osculation algorithms, Koebe, logarithmic
% Koebe and sinh-log-Koebe. Schwarz-Christoffel prevertice angles are computed
% by each algorithm, scaled so that each of them has equal first prevertice
% at 1, and shows the differences to the Koebe algorithm result.
%
% Each osculation algorithm is run only 20 times in this example
%
% Mikko Nummelin, 2008

1;

% Generation of test data

p=[0,5,5+i,3+i,3+2i,6+2i,5+3i,3+3i,3+4i,7+5i,5i,4i,2.5+4i,2+3i,-3+3i,-3-i,...
-2+2i,4+2.5i,4+2.4i,-1.9+1.8i,4+.5i,.3i];
p2=p-(2+1.5i);
p2=p2./abs(max(p));
[pmesh,p_ind]=adjpolygon_MATLAB(p2);
plot([p2,p2(1)],'b-',pmesh,'*',exp(i*[0:pi/100:2*pi]),'k-',0,0,'+');
fprintf('Original polygon edge meshed. Press any key.\n');
pause;

% The standard Koebe algorithm

q_koebe=koebe_MATLAB(pmesh,20);
plot([q_koebe,q_koebe(1)],'b-',q_koebe,'*',exp(i*[0:pi/100:2*pi]),'k-',...
0,0,'+');
koebe_preverts=imag(log(q_koebe(p_ind)))
fprintf('Standard Koebe algorithm applied 20 times. Approximate \
SC-prevertices are shown. Press any key.\n');
pause;

% The logarithmic Koebe algorithm

q_logkoebe=logkoebe_MATLAB(pmesh,20);
plot([q_logkoebe,q_logkoebe(1)],'b-',q_logkoebe,'*',exp(i*[0:pi/100:2*pi]),...
'k-',0,0,'+');
logkoebe_preverts=imag(log(q_logkoebe(p_ind)))
fprintf('Logarithmic Koebe algorithm applied 20 times. Approximate \
SC-prevertices are shown. Press any key.\n');
pause;

% The sinh-log algorithm

q_sinhlog=sinhlog_MATLAB(pmesh,20);
plot([q_sinhlog,q_sinhlog(1)],'b-',q_sinhlog,'*',exp(i*[0:pi/100:2*pi]),...
'k-',0,0,'+');
sinhlog_preverts=imag(log(q_sinhlog(p_ind)))
fprintf('Sinh-log Koebe algorithm applied 20 times. Approximate \
SC-prevertices are shown. Press any key.\n');
pause;

% Normalizes the prevertices
koebe_preverts=koebe_preverts-koebe_preverts(1);
logkoebe_preverts=logkoebe_preverts-logkoebe_preverts(1);
sinhlog_preverts=sinhlog_preverts-sinhlog_preverts(1);

% The final conclusion
logkoebe_preverts-koebe_preverts
sinhlog_preverts-koebe_preverts
fprintf('Differences between logarithmic Koebe and sinh-log Koebe \
approximated SC-prevertices are shown.\n');
