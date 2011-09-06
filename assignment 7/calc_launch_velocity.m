function [u0,v0] = calc_launch_velocity(lrest,lmax,lmin,k,L)
% Take the spring properties (lrest,lmax,lmin,k,L) of a catapult and 
% calculate the velocity at which a ball of known mass and distance from 
% pivot point will launch
    %constants
    %ballRadius = 2.54/100; %cm -> m, radius of the ball being catapulted
    ballMass = 12.7/1000; %grams -> kilograms, mass of ball
    ballPivotLength = 0.53; %Distance the ball is from the pivot point (m)
    %ballLaunchHeight = 0.4; %Height the ball is launched at (m)
    
    catapultArmLength = 0.51; %length of the catapult arm (m)
    catapultArmMass = 0.388; %mass of the catapult arm (kg)
    
    numSprings = length(k); %number of springs = num of spring constants given
    xmax = zeros(1,numSprings); %empty matrix
    xmin = zeros(1,numSprings); %empty matrix
    
    %inertia on pivot point by catapult arm
    armInertia = (1/3)*catapultArmMass*catapultArmLength^2;
    %inertia on pivot point by ball
    ballInertia = ballMass*ballPivotLength^2;
    momentOfInertia = armInertia + ballInertia; %total inertia on pivot point
    %calculate the maximum and minimum extensions for each spring used
    for y = 1:numSprings
        xmax(y) = lmax(y) - lrest(y);
        xmin(y) = lmin(y) - lrest(y);
    end
    %all variables are now of the same dimension, so we can just work out
    %the energy of each spring using matrices, without a loop
    springEnergy = (1/2)*k.*(xmax.^2 - xmin.^2) + L.*(xmax - xmin);
    energyTotal = sum(springEnergy); %sum of all the energies of the springs
    
    %ALL of the spring energy is converted to kinetic energy. Therefore
    %KE = energyTotal. KE = (I*w^2)/2 = (momentOfInertia*omega^2)/2
    %momentOfInertia*omega^2 = 2KE
    %omega^2 = 2KE/momentOfInertia
    %omega = sqrt(2energyTotal/momentOfInteria)
    omega = sqrt((2*energyTotal)/momentOfInertia); %angular velocity
    velocity = omega*ballPivotLength; %resultant velocity
    %use triangle to determine velocity components
    u0 = velocity*cosd(45); %x-component
    v0 = velocity*sind(45); %y-component
    
end