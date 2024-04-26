function bvp = bvpComplete(gamma,h)

  x = 0:h:1;
  n = numel(x) - 2;

  A=zeros(n,n);
  A(1,1) = ((2*gamma)+(h*h));
  A(1,2) = (h-(2*gamma)-(gamma*h))/2;
  A(n,n-1) = ((gamma*h)-h-(2*gamma))/2;
  A(n,n) = ((2*gamma)+(h*h));

  for i=2:(n-1)
  A(i,i) = ((2*gamma)+(h*h));
  A(i,i-1) = ((gamma*h)-h-(2*gamma))/2;
  A(i,i+1) = (h-(2*gamma)-(gamma*h))/2;
  end

  f = linspace(0,0,n)';
  f(1) = (0.5/2)*((2*gamma)+h-(gamma*h));
  f(n) = ((2*gamma)+(gamma*h)-h)/2;

  y = A\f; 
  yNew = linspace(0,0,numel(x))'; 
  yNew(1) = 0.5; 
  yNew(numel(x)) = 1;
  
  j = 1; 
  
  for i=2:(numel(x)-1) 
  yNew(i) = y(j);
  j = j+1;
  end
  
  figure;plot(x,yNew); 
  title('ODE solution (full matrix)'); 
  xlabel('x'); ylabel('y');
  
  temp = h;

  yTrue = linspace(0,0,numel(x))';

  for i=1:numel(x)
  yTrue(i,1) =	0.11623*exp(2*temp)+0.384*exp(-temp);
  temp = temp + h;
  end

  e = linspace(0,0,numel(x))';
    
  for i=1:(numel(x)) 
  e(i,1) = yTrue(i,1) - yNew(i,1); 
  end

  %disp(e);