function r = runner()

result = matlab_DragsterAssignment();

r=struct();
r.Velocity=[result.Velocity];
r.LongAcc=[result.LongAcc];
r.TimeTotal=[result.TimeTotal];
r.Distance=[result.Distance];

quarter_mile=402.336;
r.finishing_time=interp1(r.Distance,r.TimeTotal,quarter_mile,'pchip');
%indexes=find(r.Distance<=quarter_mile);
%finnishing_time=r.TimeTotal(indexes(end));
