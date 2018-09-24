gridnumber=98;
viscosity=0.001;

deltat=0.001;
step=3000;

deltax=2*pi/(gridnumber+2)

column = [0 .5*(-1).^(1:gridnumber+1).*cot((1:gridnumber+1)*deltax/2)]';
D = toeplitz(column,column([1 gridnumber+2:-1:2]));
column2 = [-1/6-pi^2/(3*deltax^2) -0.5*(-1).^(1:gridnumber+1).*(sin((1:gridnumber+1)*deltax/2)).^2]';
D2 = toeplitz(column2,column2([1 gridnumber+2:-1:2]));

for i=1:gridnumber+2
      x(i)=0+deltax*(i-2)

end


for i=2:gridnumber+1
  u(1,i)=sin(x(i));
end

    
   u(1,1)=u(1,gridnumber+1);
    u(1,gridnumber+2)=u(1,2);



for n=1:step
    
    dudx(n,:)=D*u(n,:)';
    du2dx2(n,:)=D2*u(n,:)';


  for i=2:gridnumber+1
      
    u(n+1,i)=u(n,i)-deltat*u(n,i)*dudx(n,i)+deltat*viscosity*du2dx2(n,i);

  end
   u(n+1,1)=u(n+1,gridnumber+1);
    u(n+1,gridnumber+2)=u(n+1,2);
 

end

plot(u(2,:));
axis ([2 99 -1 1])
hold on;
plot(u(300,:));
plot(u(600,:));
plot(u(900,:));
plot(u(n/2-1,:));
plot(u(n-1,:));