function assignment2_4 = assignment2_4 (n)
  
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
  P = zeros(tempN, tempN);
  
  numb = 1;
  temp1 = 2;
  
  P(1,1) = sin(pi*(tempN-1)*h);
  P(1,tempN) = 0.5*(((tempN-1)*h)**2);
  
  for i=2:tempN - 1
    P(i,1) = sin(pi*(tempN-1-numb)*h);
    P(1,temp1) = 0.5*((numb*h)**2);
    P(i,tempN) = (exp(pi) * sin(pi*(tempN-1-numb)*h)) + (0.5*(((tempN-1-numb)*h)**2));
    if i == 2
      P(i,i) = -P(i-1,i) - P(i,i-1) + (((((i-1)*h)**2)+(((tempN-2)*h)**2))*h*h);
    end
    if i == (tempN - 1)
      P(i,i) = -P(i,i+1) - P(i+1,i) + (((((tempN-2)*h)**2)+(((i-1)*h)**2))*h*h);
    end
    numb += 1;
    temp1 += 1;
  end
 
  P(2, tempN-1) = -P(1,tempN-1) - P(2,tempN) + (((((tempN-2)*h)**2)+(((tempN-2)*h)**2))*h*h);
  P(tempN-1, 2) = -P(tempN-1, 1) - P(tempN, 2) + (((((i-1)*h)**2)+(((i-1)*h)**2))*h*h);
 
  numb = 3;
 
  for i=3:tempN - 2
    P(2,i) = -P(1,i) + (((((i-1)*h)**2)+(((tempN-2)*h)**2))*h*h);
    P(i,2) = -P(i,1) + ((((1*h)**2)+(((tempN - numb)*h)**2))*h*h);
    P(tempN-1,i) = -P(tempN,i) + (((((i-1)*h)**2)+((1*h)**2))*h*h);
    P(i,tempN-1) = -P(i, tempN) + (((((tempN-2)*h)**2)+(((tempN - numb)*h)**2))*h*h);
    numb += 1;
  end
    
  k = 1;
  
  for i = (tempN-1):-1:2
    for j=2:tempN-1
      b(k) = P(i,j);
      k += 1;
    end
  end
  
  for i = 1: newNSqr
    if b(i) == -(0.0)
      b(i) = max(b(i),0);
    end
  end
  
  u = A\b;
  
  B=zeros(tempN,tempN);
  
  numb = 1;
  temp1 = 2;

  B(tempN,1) = sin(pi*(tempN-1)*h);  
  B(tempN,tempN) = 0.5*(((tempN-1)*h)**2);
  
  for i=2:tempN - 1
    B(i,1) = sin(pi*(numb)*h);
    B(tempN,temp1) = 0.5*((numb*h)**2);
    B(temp1,tempN) = (exp(pi) * sin(pi*(numb)*h))+ (0.5*((numb*h)**2));
    numb += 1;
    temp1 += 1;
  end
  
  k = 1;
  
  for i = 2:tempN-1
    for j=2:tempN - 1
      B(i,j) = u(k);
      k++;
    end
  end
  
  [X,Y] = meshgrid(x,y);
  surf(X,Y,B);
  title('Poisson (Bonus problem) solution (full matrix) for N = 32'); 
  xlabel('x'); ylabel('y'); zlabel('u');