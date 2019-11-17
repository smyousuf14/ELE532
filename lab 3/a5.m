function [D] = a5(Dn)
n=-500:500;
D=0.25*sinc(n/4);  
t=[-300:1:300];
w=pi*0.1;
x=zeros(size(t));
for i = 1:length(n)
 x=x+D(i)*exp(j*n(i)*w*t);
 't'
end

figure(5);
plot(t,x,'k')
xlabel('t(sec)');
ylabel('x(t)');
axis([-300 300 -1 2]);
title('The Reconstructed Fourier Coefficients');
grid;