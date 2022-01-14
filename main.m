function main
format short e
rng('default')
n=2;
p=[1, 1; -1, 2];
%n
%p
pinv=[2/3, -1/3; 1/3, 1/3];
%pinv
prod = pinv*p;
%prod
vals = [-5,3];
d = diag(vals);
%vals
%d
a = p*d*pinv;
%a
x=p(:,1);
x=x/norm(x);
val = vals(1);
%x
%val
[x2,val2] = powermethod(a,n)
dif = a*x2 - val2*x2;
dif
err=(val-val2) / val;
err
end
function [x,val] = powermethod(a,n)
x = rand(n,1);
tol=eps*100;
for i=1:100
x = a*x;
x = x/norm(x);
val = x'*a*x;
err = norm(a*x - val*x) / abs(val);
%err
%x
%val
if (err < tol)
break;
end
end
tol
%i 
%err
end
