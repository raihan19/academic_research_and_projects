function assignment2_3 = assignment2_3 (n)
  
  h = 1/n;
  
  x = 0:h:1;
  y = 0:h:1;
  newN = n - 1;
  
  newNSqr = newN * newN;

  A=zeros(newNSqr,newNSqr); 
  count1 = 1;
  count2 = 1; 
  
  for i=1:(newNSqr) 
    A(i,i) = -4;
    
    if i <= (newNSqr - newN)
      A(i, (i+newN)) = 1;
    end
    if i >= n
      A(i, (i-newN)) = 1;
    end
    
    if count1 != newN && i <= newNSqr - 1
      A(i,i+1) = 1;
      count1 += 1;
    elseif count1 == newN
      count1 = 1;
    end
    
    if count2 != newN && i >= 2
      A(i,i-1) = 1;
      count2 += 1;
    elseif count2 == newN
      count2 = 1;
    end
  end
  
  b = linspace(0,0,newNSqr)';
  
  tempN = (n+1);
  
  k = 1;
  
  for i = 1:tempN-2
    for j=1:tempN-2
      b(k) = -(100*h*h*(((i*h)*(i*h))+((j*h)*(j*h))));
      k += 1;
    end
  end
  
  u = A\b;
    
  B=zeros(tempN,tempN);
    
  k = 1;
  
  for i = 2:tempN-1
    for j=2:tempN - 1
      B(i,j) = u(k);
      k++;
    end
  end
  
  [X,Y] = meshgrid(x,y);
  surf(X,Y,B);
  title('Poisson solution (full matrix) for N = 32');
  xlabel('x'); ylabel('y'); zlabel('u');