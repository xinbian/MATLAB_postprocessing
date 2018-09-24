N=120;
averno=21;
%piv1=piv-c;
%pib1=pib+c;
%semilogx(piv1);hold on;semilogx(pib1);semilogx(pit);semilogx(c);
pivavr(1:N)=0;
pibavr(1:N)=0;
pitavr(1:N)=0;
cavr(1:N)=0;
tmp=0;
for i=1:N
for k=1:averno
    tmp=tmp+pivtotal((k-1)*(N+1)+i+1); 
end
pivavr(i)=tmp;
tmp=0;
end
pivavr=pivavr/averno;
pivavr=pivavr';


tmp=0;
for i=1:N
for k=1:averno
    tmp=tmp+pibtotal((k-1)*(N+1)+i+1); 
end
pibavr(i)=tmp;
tmp=0;
end
pibavr=pibavr/averno;
pibavr=pibavr';

tmp=0;
for i=1:N
for k=1:averno
    tmp=tmp+pittotal((k-1)*(N+1)+i+1); 
end
pitavr(i)=tmp;
tmp=0;
end
pitavr=pitavr/averno;
pitavr=pitavr';

for i=1:N
for k=1:averno
    tmp=tmp+ctotal((k-1)*(N+1)+i+1); 
end
cavr(i)=tmp;
tmp=0;
end
cavr=cavr/averno;
cavr=cavr';


% for i=1:N
% for k=1:averno
%     tmp=tmp+c0total((k-1)*(N+1)+i+1); 
% end
% c0avr(i)=tmp;
% tmp=0;
% end
% c0avr=c0avr/averno;
% c0avr=c0avr';
% for i=1:120
%     ref(i)=0.18104;%0.0298775248  0.177798333 
% end

pivavr1=pivavr-cavr;
pibavr1=pibavr+cavr;
figure(1);
semilogx(pivavr1);hold on;semilogx(pibavr1);semilogx(pitavr);semilogx(cavr);semilogx(cavr+c0avr);
semilogx((pivavr1+pivavr1_new)/2);hold on;semilogx((pibavr1+pibavr1_new)/2);semilogx((pitavr+pitavr_new)/2);semilogx((cavr+c0avr+cavr_new+c0avr_new)/2);


xlim([0 241]);
xlabel('k');
legend('U field energy transfer','B field energy transfer','total energy transfer','conversion');
legend('U field energy transfer','B field energy transfer','total energy transfer','conversion','conversion2');
legend('U field energy transfer','B field energy transfer','total energy transfer','conversion','conversion2','vdiss');
legend('U field energy transfer^{256}','B field energy transfer^{256}','total energy transfer^{256}','conversion^{256}','U field energy transfer^{512}','B field energy transfer^{512}','total energy transfer^{512}','conversion^{512}');
legend('U field energy transfer^{256}','B field energy transfer^{256}','total energy transfer^{256}','conversion^{256}','U field energy transfer^{512}','B field energy transfer^{512}','total energy transfer^{512}','conversion^{512}','U field energy transfer^{1024}','B field energy transfer^{1024}','total energy transfer^{1024}','conversion^{1024}');
tmp2=sum(bdiss);
semilogx(pivavr1_5,'--');hold on;semilogx(pibavr1_5,'--');semilogx(pitavr_5,'--');semilogx(cavr_5,'--');

semilogx(pivavr1,'--');hold on;semilogx(pibavr1,'--');semilogx(pitavr,'--');;semilogx(cavr+c0avr,'--');
semilogx(pivavr256,'--');hold on;semilogx(pibavr256,'--');semilogx(pitavr256,'--');;semilogx(cavr256,'--');
semilogx(pivavr512,'-.');hold on;semilogx(pibavr512,'-.');semilogx(pitavr512,'-.');;semilogx(cavr512,'-.');
semilogx(pivavr1024,'-');hold on;semilogx(pibavr1024,'-');semilogx(pitavr1024,'-');;semilogx(cavr1024,'-');
%{
h_FigSpec1 = figure('Name','Eng','Units','centimeters','Position',[0 12 16 12]); %[Left Bottom Width Height]
pos = get(gca,'position');
set(gca,'position',[pos(1) 0.14 1.1*pos(3) 0.9*pos(4)]);
set(gca,'FontSize',10);
axis on;
figure(2);
plot(totale);hold on;plot(ke);plot(me);plot(vdiss);plot(bdiss);
legend('total energy','kinetic energy','magnetic energy','V field dissipation','B field dissipation');
xlabel('time steps/500');
ylabel('energy');
testx=(1:120);
testx=testx';
testy=testx.^(-5/3);

figure(3)
loglog(spece);hold on;loglog(specb);loglog(testy);
ylim([0.0000001 10]);
xlim([0 120]);
%}


pitavr1024=pitavr1024/0.2920
pibavr1024=pibavr1024/0.2920
pivavr1024=pivavr1024/0.2920
cavr1024=cavr1024/0.2920



N=60;
averno=3;

%calculate averaged spectrum

spece(1:N)=0;
specb(1:N)=0;

tmp=0;
for i=1:N
for k=1:averno
    tmp=tmp+specetotal((k-1)*(N+1)+i+1); 
end
speceavr(i)=tmp;
tmp=0;
end
speceavr=speceavr/averno;
speceavr=speceavr';



tmp=0;
for i=1:N
for k=1:averno
    tmp=tmp+specbtotal((k-1)*(N+1)+i+1); 
end
specbavr(i)=tmp;
tmp=0;
end
specbavr=specbavr/averno;
specbavr=specbavr';

spece_cum(1:N)=0.0;
specb_cum(1:N)=0.0;
for i=1:N
spece_cum(i)=sum(speceavr(1:i));
specb_cum(i)=sum(specbavr(1:i));
end

%semilogx(spece_cum);hold on;semilogx(specb_cum);hold off;
%legend('U field','B field');
spectotal_cum=spece_cum+specb_cum;
semilogx(spece_cum);hold on;semilogx(specb_cum);semilogx(spectotal_cum);semilogx(pitavr);semilogx(pitavr+spectotal_cum');hold off;






