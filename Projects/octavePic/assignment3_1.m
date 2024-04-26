n = 0;
N = 41;
c = 1;
delX = 2/40;
x_i = zeros(1, N);
u_i_n = zeros(1, N);
ubar_i_n_plus_1 = zeros(1, N);
u_i_n_plus_1 = zeros(1, N);

for i = 1: N
  x_i(i) = (i-1) * delX;
end

for i = 1: N
  if x_i(i) <= 0.5
    u_i_n(i) = 1;
  else
    u_i_n(i) = 0.5;
  end
end

plot(x_i, u_i_n);

while n < 10
  delT = 0.9 * delX / c;
  
  for i = 1: N-1
    ubar_i_n_plus_1(i) = u_i_n(i) - (u_i_n(i+1) - u_i_n(i));
  end
  
  for i = 2: N-1
    u_i_n_plus_1(i) = 0.5*(u_i_n(i) + ubar_i_n_plus_1(i) - (ubar_i_n_plus_1(i) - ubar_i_n_plus_1(i-1)));
  end

  u_i_n_plus_1(N) = u_i_n(N) - (u_i_n(N) - u_i_n(N-1));
  
  for i = 2: N
    u_i_n(i) = u_i_n_plus_1(i);
  end
  
  n = n+1;
  
end

hold on;
  
plot(x_i, u_i_n);
title('Method (6) - MacCormack part (b)'); 
xlabel('x'); ylabel('u');
      
hold off;