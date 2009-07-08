1;

z=[];
for x=-5:.2:5
  for y=0:.2:5
    z=[z x+i*y];
  end
end

plot(z,'*'); pause;

w=sqrt(z);

plot(w,'*'); axis('equal');