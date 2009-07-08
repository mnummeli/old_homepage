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
print('labyrinth.eps','-Peps');

q_koebe=koebe_step_MATLAB(pmesh);
plot([q_koebe,q_koebe(1)],'b-',q_koebe,'*',exp(i*[0:pi/100:2*pi]),'k-',...
0,0,'+');pause;
print('labyrinth_koebe.eps','-Peps');

q_logkoebe=logkoebe_step_MATLAB(pmesh);
plot([q_logkoebe,q_logkoebe(1)],'b-',q_logkoebe,'*',exp(i*[0:pi/100:2*pi]),'k-',...
0,0,'+');pause;
print('labyrinth_logkoebe.eps','-Peps');

q_sinhlog=sinhlog_step_MATLAB(pmesh);
plot([q_sinhlog,q_sinhlog(1)],'b-',q_sinhlog,'*',exp(i*[0:pi/100:2*pi]),'k-',...
0,0,'+');pause;
print('labyrinth_sinhlog.eps','-Peps');
