gridnumber=98;
viscosity=0.05;
length=2*pi;
deltat=0.008;
step=4000;

deltax=length/(gridnumber-1);


for i=1:gridnumber+2
      x(i)=0+deltax*(i-2)
end


for i=2:gridnumber+1
  u(1,i)=sin(x(i));
end

    
    u(1,1)=u(1,gridnumber+1);
    u(1,gridnumber+2)=u(1,2);
  



for n=1:step
  for i=2:gridnumber+1
      dudx(n,i)=(u(n,i+1)-u(n,i-1))/(2*deltax);
      du2dx2(n,i)=(u(n,i+1)-2*u(n,i)+u(n,i-1))/(deltax)^2;
      u(n+1,i)=u(n,i)-deltat*u(n,i)*dudx(n,i)+deltat*viscosity*du2dx2(n,i);
  end
    u(n+1,1)=u(n+1,gridnumber+1);
    u(n+1,gridnumber+2)=u(n+1,2);
   
 
end


plot(u(2,:));
axis ([2 99 -1 1])
hold on;
plot(u(500,:));
plot(u(1000,:));
plot(u(2000,:));
plot(u(3000,:));
plot(u(4000,:));
