function [gear_demand, Throttle] = student_AutomaticGearbox(Gear, RPM, LongAcc, Velocity, Throttle, Distance, TimeLap)
% Convert m/s to km/h
Speed = Velocity * 3.6;
Throttle = 1;
% Check the speed and determine gear

if RPM > 9000
    wanted_gear = Gear+1;
else
    wanted_gear = Gear;
end;

if wanted_gear==-1
    wanted_gear=1;
elseif wanted_gear>4;
   wanted_gear=4;
end;
    
gear_demand = wanted_gear;
    
% For comparasion, uncomment the line below to see how caster gearbox performs
% gear_demand = caster_AutomaticGearbox(Gear, RPM, LongAcc, Velocity, Throttle, Distance, TimeLap);
end