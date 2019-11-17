clf;
n = (-500:500);
D_n = (1./(n.*pi).*sin((n.*pi)./4));


subplot(1,2,1); stem(n,abs(D_n),'.k');
xlabel('n'); ylabel('|D_n|');
subplot(1,2,2); stem(n,angle(D_n),'.k');
xlabel('n'); ylabel('\angle D_n [rad]');