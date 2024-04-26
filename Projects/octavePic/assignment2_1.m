function assignment2_1 = assignment2_1 (h)
  x = 0:h:6;
  n = numel(x) - 2;

  A=zeros(n,n); 
  A(1,1) = ((50*h*h)-2);
  A(1,2) = (1+h); 
  A(n,n-1) = (1-h);
  A(n,n) = ((50*h*h)-2); 
  for i=2:(n-1) 
  A(i,i) = ((50*h*h)-2); 
  A(i,i-1) = (1-h); 
  A(i,i+1) = (1+h); 
  end

  fTop = (50*h*h); 
  fBottom = ((50*h*h)-1-h);
  
  f = linspace(0,0,n)'; 
  f(1) = fTop; 
  f(n) = fBottom; 
  f(2:(n-1)) = (50*h*h);
  
  y = A\f;
 
  yNew = linspace(0,0,numel(x))'; 
  yNew(1) = 0; 
  yNew(numel(x)) = 1;
  j = 1; 
  for i=2:(numel(x)-1) 
  yNew(i) = y(j);
  j = j+1;
  end
  
  figure;plot(x,yNew); 
  title('ODE solution (full matrix) for h = 0.001'); 
  xlabel('x'); ylabel('y');