function y = sin_taylor(x,a,N)

% f(x) = f(a) + f'(a)/(1!)(x-a) + f"(a)/(2!)(x-a)^2 + ...


Ns=0:N;
for i=Ns+1
   
    n=i-1;
    derivatives(i) = sin_derivative(n,a);
        
end;

Ns_matrix = repmat(Ns,length(x),1);
X_matrix = repmat(x(:),1,length(Ns));


ys = derivatives./factorial(Ns_matrix).*(X_matrix-a).^Ns_matrix;
y=sum(ys,2);
