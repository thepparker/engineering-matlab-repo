L = 10;
w = 1000;
AInc = 0.1;
AngleToRadians = pi/180;

x=0:0.1:10;
n = length(x);

for i = 1:n
    Vx(i) = quad8 ('fV731',0,x(i),[],[],w,L);
    Mx(i) = quad8 ('fB731',0,x(i),[],[],w,L);
end

figure(1); clf;
subplot (2,1,1)
plot (x,Vx)
xlabel ('x (ft)')
ylabel ('V(x) (lb)')
subplot (2,1,2)
plot (x,Mx)
xlabel ('x (ft)')
ylabel ('M(x) (lb-ft)')
