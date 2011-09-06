clear all

h=0.01;
g=9.81;

theta0=45*pi/180; %convert to radians
omega0=0;

t=0:h:2;
theta(1)=theta0;
omega(1)=omega0;
L=10-3*t(1);
x(1)=L*sin(theta(1));
y(1)=-L*cos(theta(1));


N=length(t)-1;


for n=1:N
    L=10-3*t(n);
    theta(n+1)=theta(n)+h*(omega(n));
    omega(n+1)=omega(n)+(h/L)*(-2*(-3)*omega(n)-g*sin(theta(n))); 
    x(n+1)=L*sin(theta(n+1));
    y(n+1)=-L*cos(theta(n+1));
    
end

plot(x,y,'ko')
axis([-10 10 -10 0]);
grid on;