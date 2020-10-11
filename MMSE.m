%MMSE 编法 P208
%NOISE=stationary_noise_evaluate(Y,L,k)

for b=1:L
    a=0.98;
    q=0.2;
    A=[0.1*abs(Y(b)),zeros(1,k-1)];
    sl=[a*abs(Y(b)).^2/NOISE(b),zeros(1,k-1)];
    for t=1:k-1;
        xl(t+1)=abs(Y(b+t*L)).^2;
        r(t+1)=xl(t+1)/NOISE(b+t*L);
        if r(t+1) >= 700
            r(t+1)=700;
        elseif r(t+1)<1
            r(t+1)=1.5;
        end
        sl(t+1)=a*(A(t).^2/NOISE(b+(t-1)*L))+(1-a)*max(r(t+1)-1,0);%后验信噪比
        v(t+1)=(sl(t+1)/(1+sl(t+1)))*r(t+1);
        if v(t+1)<0.1
            expint(t+1)=-2.31*log10(v(t+1))-0.6;
        elseif v(t+1)>=0.1 & v(t+1)<=1
            expoint(t+1)=-1.544*log10(v(t+1))+0.166;
        elseif v(t+1)>1
            expoint(t+1)=10.^(-0.52*(v(t+1))-0.26);
        end
      Gmmse(t+1)=(sl(t+1)/(1+sl(t+1)))*exp(0.5*expoint(t+1));
      w(t+1)=((1-q)/q)*(exp(v(t+1))/(1+sl(t+1)));
      A(t+1)=(w(t+1)/(1+w(t+1)))*Gmmse(t+1)*abs(Y(b+t*L));
    end
    A1(1+(b-1)*k:b*k)=A(1:k);
end

for t1=1:k
    for j=1:L
        d(j)=A1(t1+(j-1)*k);
    end
    A2(1+(t1-1)*L:t1*L)=d(1:L);
end
for t2=1:k
    S=A2(1+(t2-1)*L:t2*L);
    ang=Y(1+(t2-1)*L:t2*L)./abs(Y(1+(t2-1)*L:t2*L));
    S=S.*ang;
    s=ifft(S);
    s=real(s);
    enspeech(1+(t2-1)*L/2:L+(t2-1)*L/2)=enspeech(1+(t2-1)*L/2:L+(t2-1)*L/2)+s;
    
    win(1+(t2-1)*L/2:L+(t2-1)*L/2)=win(1+(t2-1)*L/2:L+(t2-1)*L/2)+h;
end
enspeech=enspeech./win;

        
