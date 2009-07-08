function w=eqpolygon_MATLAB(v,n)
% Mikko Nummelin, 2007

    if nargin<2
        n=100;
    end
    len=length(v);
    w=[];
    for k=1:len
        curr=v(k);
        if k<length(v)
            next=v(k+1);
        else
            next=v(1);
        end
        m=abs(next-curr)*n;
        for k2=0:m-1
            w=[w,curr+(next-curr)*k2/m];
        end
    end
end
