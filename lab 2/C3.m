% First create the u(t) function
u = @(t) 1.0.* (t>=0);

% Create the x(t) function.
x = @(t) sin(5*t).*(u(t) - u(t - 3));

% Now truncate each of the impluse response funtions.
h1 = @(t) exp(t/5).*(u(t)-u(t-20)); 
h2 = @(t) 4*exp(-t/5).*(u(t)-u(t-20)); 
h = @(t) 4*exp(-t).*(u(t)-u(t-20));
h4 = @(t) 4*(exp(-t/5)-exp(-t)).*(u(t)-u(t-20)); %h4

% Modified CH2MP4 from B.1
dtau = 0.005;
tau = 0:dtau:20; ti = 0; 
tvec = 0:.1:20; y = NaN*zeros(1,length(tvec));
% Pre-allocate memory
for t = tvec,
    ti = ti+1; % Time index
    xh = x(t-tau).*h(tau); 
    lxh = length(xh);
    y(ti) = sum(xh.*dtau); 
    % Trapezoidal approximation of convolution integral
    subplot(2,1,1),plot(tau,h(tau),"k-",tau,x(t-tau),"k--",t,0,"ok");
    axis([tau(1) tau(end) -2.0 2.5]);
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)],...
        [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
        [.8 .8 .8],"edgecolor","none");
    xlabel("\tau"); title("h(\tau) [solid], x(t-\tau) [dashed], h(\tau)x(t-\tau) [gray]");
    c = get(gca,'children'); set(gca,'children',[c(2);c(3);c(4);c(1)]);
    subplot(2,1,2),plot(tvec,y,"k",tvec(ti),y(ti),"ok");
    xlabel("t"); ylabel("y(t) = \int h(\tau)x(t-\tau) d\tau");
    axis([tau(1) tau(end) -1.0 2.0]); grid;
    drawnow;
end

