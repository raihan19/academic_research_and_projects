function bvp = bvp (h)
  x = 0:h:1;
  n = numel(x) - 2;
  
  A=zeros(n,n); 
  A(1,1) = (4+(4*power(h,2)));
  A(1,2) = (-2+h); 
  A(n,n-1) = (-2-h);
  A(n,n) = (4+(4*power(h,2))); 
  
  for i=2:(n-1) 
  A(i,i) = (4+(4*power(h,2))); 
  A(i,i-1) = (-2-h); 
  A(i,i+1) = (-2+h); 
  end

  fTop = 0.5 * (2+h); 
  fBottom = (2-h);
  
  f = linspace(0,0,n)'; 
  f(1) = fTop; 
  f(n) = fBottom; 
  f(2:(n-1)) = 0;
  
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
    
  yTrue = linspace(0,0,numel(x))';
  
  temp = h;
  
  for i=1:(numel(x))
  yTrue(i,1) = (0.11623 * exp(2*temp)) + (0.384 * exp(-temp));
  temp += h; 
  end
  
  e = linspace(0,0,numel(x))';
  
  for i=1:(numel(x)) 
  e(i,1) = yTrue(i,1) - yNew(i,1); 
  end
  
  %figure;plot(x,e); 
  %title('Error'); 
  %xlabel('x'); ylabel('e');
  
  %p = ['Euclidean norm of vector e: ', num2str(norm(e))];
  %q = ['Infinity norm of vector e: ', num2str(norm(e,inf))];
  
  %disp(p);
  %disp(q);