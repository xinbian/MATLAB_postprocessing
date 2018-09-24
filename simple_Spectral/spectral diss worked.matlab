
N=1024;
dx = 2*pi/N;
x = 0:dx:2*pi-dx;
x = x';


% define the mesh 
dt = 0.01;

M=2000;
D=0.6;

% IC3

u(1:N,1) = 0;
u(250:750,1) = 1;
%u(N+1,1)=u(N,1);
%u(N+2,1)=u(1,1);



for j=1:M

% forrier transform

  v = fft(u(:,j));
  for k = 1:floor(N/2)-1


    v(k+1) = v(k+1)*((1-.5*D*dt*k^2)/(1+.5*D*dt*k^2));
    v(N-k+1) = v(N-k+1)*(1-.5*D*dt*(-k)^2)/(1+.5*D*dt*(-k)^2);

  end
  v(floor(N/2)+1) = 0;
  
% inverse

  u(:,j+1) = real(ifft(v)); 
  
  
 % u(N+1,j+1)=u(N,j+1);
 % u(N+2,j+1)=u(1,j+1);
  
end


plot(u(:,1));
axis ([1 1024 -0.1 1.1])
hold on;
plot(u(:,400));
plot(u(:,800));
plot(u(:,1200));
plot(u(:,1600));
plot(u(:,2000));
