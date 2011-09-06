function SFD_n_BMD(len,F,a,M,b)
% Inputs:
% len: Beam length [m];
% F: Concentrated point load [N];
% a: Distance of point load from the left [m]
% M: Applied moment [Nm];
% b: Distance of applied moment from the left [m]

%Reactions by supports at left and right of beam
reactionRight = (F*a + M) / len;
reactionLeft = F - reactionRight;

%debugging info
fprintf('Left reaction: %d. Right reaction: %d\n', reactionLeft, reactionRight);

%Setup shear plot
x = 0:1:len;
figure(1);
y(1:1:a) = reactionLeft; %shear force between left and point force
y(a+1:1:len) = -reactionRight; %shear force between point force and right
y(end+1) = 0; %last point is 0 (so diagram shows return to 0)

stairs(x,y); %plot shear diagram
hold on; %stop the graph from being overwritten
plot(x,zeros(1,length(x)),'r-'); %0 line through shear diagram
hold off;

%labels for sfd
title('Shear Force Diagram');
xlabel('Length (metres)');
ylabel('Shear Force (N)');
axis([0 len+1 -reactionRight-50 reactionLeft+50]); %increase axis

figure(2); %new figure for bmd

%calculate bmd values
z = [ 0:1:b b b+1:len ]; %x axis for graph

y = zeros(1,len+2); %empty matrix for bending moment values
y(1) = 0; %initial point is 0
for i = 1:a %between 0 metres and a metres
    y(i+1) = y(i) + reactionLeft; %add reactionLeft each iteration
end
u = 1; %multiplication factor for reaction force
for i = a+1:b %between point force and applied moment
    y(i+1) = y(a+1) - reactionRight*u; %integral over a+1:b
    u = u + 1; %inc u
end
y(b+2) = y(b+1) + M; %add moment force to last calculated point
u = 1; %multiplication factor
for i = b+2:len %between moment force and end of beam
    y(i+1) = y(b+2) - reactionRight*u; %integral over b+2:len
    u = u + 1; %inc u
end

plot(z,y); %plot bmd diagram
hold on; %stop graph being overwritten
plot(z,zeros(1,length(z)),'r-'); %0 line
hold off;

%labels for bmd
title('Bending Moment Diagram');
xlabel('Length (metres)');
ylabel('Bending Moment (Nm)');
axis([0 len+1 -1 y(b+2)+100]);
end