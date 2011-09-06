function [t,x]=WebEuler(ode,tspan,alpha,h)

a=tspan(1);
b=tspan(2);

t=a:h:b;

N=length(t)-1;

x(1,:)=alpha;               %setting initial conditions

V = 2;

for n=1:N
    dxdt=ode(t(n),x(n,:));
    dxdt=dxdt';
    x(n+1,1) = x(n,1) + dxdt(3)*h; %theta
    x(n+1,2) = x(n,2) + dxdt(4)*h; %omega
    x(n+1,3) = -V*sin(x(n+1,1)) + x(n+1,2)*(50-V*t(n))*cos(x(n+1,1)); %u
    x(n+1,4) = V*cos(x(n+1,1)) + x(n+1,2)*(50-V*t(n))*sin(x(n+1,1)); %v
    x(n+1,5) = x(n,5) + dxdt(2)*h; %y
    x(n+1,6) = x(n,6) + dxdt(1)*h; %x
end