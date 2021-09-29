function dy = sin_derivative(n,x)

%n:dy
%0:sin
%1:cos
%2:-sin
%3:-cos
%4:sin
%...

n_=mod(n,4);

switch(n_)
    case 0
        dy = sin(x);
    case 1
        dy = cos(x);
    case 2
        dy = -sin(x);
    case 3
        dy = -cos(x);
end;
