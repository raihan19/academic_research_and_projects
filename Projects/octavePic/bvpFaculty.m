clear
clc
for h=[0.01]%[0.1 0.01 0.001]    
%Calculating the number of unknown points
N=1/h-1;
%The boundary conditions
y0=0.5;
yend=1;
%Programming the A matrix
p=-2-h;
q=4+2*h^2;
r=-2+h;
A=zeros(N,N);
for i=1:1:N
A(i,i)=q;
if i~=1
A(i,i-1)=p;
end
if i~=N
A(i,i+1)=r;
end
end
%Setting up the b vector in Ay = b
b=zeros(N,1);
b(1)=-p*y0;
b(N)=-r*yend;
%Solving for the unknown points
y_sol=A\b;
%Setting the solution vector
y=[y0;y_sol;yend];
disp(y);
%Setting up the x points
x=0:h:1;
%Plotting the Solution
plot(x,y)
xlabel('x','FontSize',18);
ylabel('y','FontSize',18);
title('h=0.01','FontSize',18);  
end