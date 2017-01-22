function [] = plot_raw_signal( Time, Temp, Fs, SF )
plot(Time,Temp,'b--')
hold on
plot(Time,smooth(Temp,Fs*SF),'r')
title('Respiration Time-Series')
grid on
axis tight
end


