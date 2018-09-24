N=120;
averno=10;
piv1=piv-c;
pib1=pib+c;

c1=c+c0;

test=1:240;
test=test';
slop=test.^(-3/2);


for i=1:120
    ref(i)=0.162;%0.0298775248  0.177798333 
end

figure(1);
semilogx(piv1);hold on;semilogx(pib1);semilogx(pit);semilogx(c);semilogx(c1);semilogx(ref);
xlim([0 240]);
xlabel('k');
set(gca,'Fontsize',15)
legend('U field energy transfer','B field energy transfer','total energy transfer','conversion','conversionmodifi','Bdiss');
axis on;


h_FigSpec1 = figure('Name','Eng','Units','centimeters','Position',[0 12 16 12]); %[Left Bottom Width Height]
pos = get(gca,'position');
set(gca,'position',[pos(1) 0.14 1.1*pos(3) 0.9*pos(4)]);
grid on;
figure(2);
plot(totale);hold on;plot(ke);plot(me);plot(vdiss);plot(bdiss);
legend('total energy','kinetic energy','magnetic energy','V field disspation','B field disspation');
xlabel('time steps/500');
ylabel('energy');
set(gca,'Fontsize',15)
grid on;




