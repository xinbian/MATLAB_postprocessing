gridnumber=98;
viscosity=25;
length=100;
deltat=0.008;
step=4000;

deltax=length/(gridnumber-1);


for i=1:gridnumber+2
      x(i)=0+deltax*(i-2)
end


for i=2:gridnumber+1
	u(1,i)=0;
end

for i=25:75
  u(1,i)=1;
end
    
    u(1,1)=u(1,gridnumber+1);
    u(1,gridnumber+2)=u(1,2);

matrixa=deltat*viscosity/(2*deltax*deltax);
matrixb=-1-deltat*viscosity/(deltax*deltax);
matrixbprime(1,1)=matrixb
  
    
for n=1:step
for i=2:gridnumber+1

   matrixbprime(n,i)=matrib-matrixa*matrixa/matrixbprime(n,i-1)
end 
  matrixbprime(n+1,1)=
end




for n=1:step
  for i=gridnumber+1:-1:2
     

     
     
      k(n,i)=-u(n,i)-viscosity*deltat*(u(n,i+1)-2*u(n,i)+u(n,i-1))/(2*deltax*deltax);

      kprime(n,i)=k(n,i)-kprime(n,i-1)*matixa/matrixbprime(n,i-1);

      u(n+1,i)=(kprime(n,i)-matrixa*u(n,i+1))/matrixbprime;
  end
    
    k(n,2)=k(n,2)-matrixa*u(n,1);
    k(n,gridnumber+1)=k(n,gridnumber+1)-matrixa*u(n,grudnumber+2)

   
    u(n+1,1)=u(n+1,gridnumber+1);
    u(n+1,gridnumber+2)=u(n+1,2);

end





plot(u(2,:));
axis ([2 99 0 1.1])
hold on;
plot(u(500,:));
plot(u(1000,:));
plot(u(2000,:));
plot(u(3000,:));
plot(u(4000,:));

