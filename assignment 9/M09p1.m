h=0.5;
t=0:h:4;
alpha=1.0;

x(1)=0.1;

for n=1:length(t)-1
    x(n+1)=x(n)+(-x(n)+2*t(n))*h;
end
x
plot(t,x,'ko-');