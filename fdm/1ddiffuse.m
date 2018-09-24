gridnumber=100;
viscosity=input('input viscosity:\n ');
length=100;
deltat=input('input deltat:\n ');
step=input('input step:\n ');

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
    
    u(1,1)=u(1,gridnumber);
    u(1,gridnumber+2)=u(1,3);
    u(1,2)=u(1,gridnumber+1);



for n=1:step
  for i=2:gridnumber+1
      du2dx2(n,i)=(u(n,i+1)-2*u(n,i)+u(n,i-1))/(deltax)^2;
      u(n+1,i)=u(n,i)+deltat*(viscosity*du2dx2(n,i));
  end
    u(n+1,1)=u(n+1,gridnumber);
    u(n+1,gridnumber+2)=u(n+1,3);
    u(n+1,2)=u(n+1,gridnumber+1);
 

end

plot(u(2,:));
hold on;
plot(u(100,:));
plot(u(500,:));
plot(u(n/2-1,:));
plot(u(n-1,:));


