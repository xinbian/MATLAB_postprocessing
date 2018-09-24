
N=1024;
dx = 2*pi/N;
x = 0:dx:2*pi-dx;



% define the mesh 
dt = 0.0005;
M=20000;
D=0.1;

% IC

u(1:N,1) = sin(x);

%u(N+1,1)=u(N,1);
%u(N+2,1)=u(1,1);



for j=1:M

% forrier transform

  v = fft(u(:,j));
  
  v=fftshift(v);

  kk=-N/2:N/2-1;
  kk=kk';

  secondderivev=-kk.^2.*v;
  firstderivev=1i*kk.*v;
  firstderiveu=real(ifft(ifftshift(firstderivev))); 
  nonlinear=fft(u(:,j).*firstderiveu);
  nonlinear=fftshift(nonlinear);

  %v=dt*(D*secondderivev-nonlinear)+v;
  
  v=exp(-D*kk.^2*dt).*(v-dt*nonlinear);

  %v=v-D*dt*kk.^2.*v;
  %for k = 2:N
  %   
%
  %  v(k) = (1-D*dt*(-N/2+k-1)^2)*v(k);
  %  
  %end


  
% inverse

  u(:,j+1) = real(ifft(ifftshift(v))); 
  
  
 % u(N+1,j+1)=u(N,j+1);
 % u(N+2,j+1)=u(1,j+1);
  
end

for i=1:50:20000
plot(u(:,i));
axis ([0 1024 -1 1])
pause(0.02);
end
