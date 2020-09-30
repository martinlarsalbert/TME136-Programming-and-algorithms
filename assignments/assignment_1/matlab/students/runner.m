function r = runner()

result = matlab_DragsterAssignment();

r=struct();
r.Velocity=[result.Velocity];
r.LongAcc=[result.LongAcc];
r.TimeTotal=[result.TimeTotal];
