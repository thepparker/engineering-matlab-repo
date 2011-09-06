clear all
h=0.01;
g=9.8;

t=0:h:8;
theta(1) = -35*pi/180;
omega(1) = 0;

L = 50-5*t;

x(1)=L(1)*sin(theta(1));
y(1)=-L(1)*cos(theta(1));

dLdt = -3;

for n=1:length(t)-1
    theta(n+1) = theta(n) + omega(n)*h;
    omega(n+1) = omega(n) + ((1/L(n))*(-2*dLdt*omega(n) - g*sin(theta(n))))*h;
    x(n+1) = L(n) * sin(theta(n));
    y(n+1) = -L(n) * cos(theta(n));
end
%x = L.*sind(theta);
%y = -L.*cosd(theta);

plot(t,theta,'ro',t,omega,'b*');
