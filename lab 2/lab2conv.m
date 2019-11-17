%sample code lab2conv.m

% create equally spaced time intervals.
t1 = -10;
t2 = 10;
N = 2000;
Delta_t = (t1-t2)/2;
t = t1:Delta_t:t2;

%create x(t)
x = zeros(size(t));
x(find(t>=-1 & t <= 1)) = 1;

%create h(t)
h = t; h( [t<-1] | [t>1]) = 0;

% Need to multiply by Delta_t as in the sum in Eq. la.
x1 = x*Delta_t;

%perform convolution
y = conv(x1,h);

%plot results
subplot (3,1,1); plot(t,x); axis([t1 t2 -0.1 1.1]);
%add title and axis label
title ("x(t)"); xlabel("x(t)");

subplot(3,1,2); plot(t,h);
title("h(t)"); xlabel("t");

subplot(3,1,3); plot(t, y(1000:3000));
title("y(t)"); xlabel("t");