function [p] = plot_approx_resp_rate(Time, Avg_RR, MidPoint)
    p = plot(Time(MidPoint),(Avg_RR),'*');
    title('Approximate Respiration')
    grid on
end