function [] = plot_resp_rate_sampen(Time, RespComplSEn, MidPoint)
p = plot(Time(MidPoint),RespComplSEn,'*');
title('Complexity (Sample Entropy)')
grid on
legend(p, '1^{st} Derivative', '3^{rd} Derivative', 'location', 'best')
grid on
axis tight
end