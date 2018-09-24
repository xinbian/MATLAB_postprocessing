rho_h = 1.0833;
rho_l = 1.0;
g = 1.0;
lambda = 0.4;
k = 2*pi/lambda;
rd = rho_l/rho_h;
ens = dlmread('bub');
area = dlmread('bub_avr_area');


omega2 = ens(1:800)./area(1:800);


bubfit = sqrt(1/(3*pi) + 0.25*rd/(1-rd)*omega2/(4*pi*k*g));
bubfit2 = sqrt(1/(3*pi) + rd/(1-rd)*omega2/(4*pi*k*g));
plot(t_dimless_0, bubfit);hold on;
plot(t_dimless_0, bubfit2);hold on;
plot(t_dimless_0, bub_vel_filter);hold off;
legend_handle=legend('{$\eta=0.25$ prediction}','{$\eta=1$ prediction}','{original data}');
set(legend_handle,'Interpreter','latex','fontsize',11)