function slip_power_freq(freq)
x = 0.0001:0.001:0.012;
output = cell(0);

for f = [50,freq]
  x2 = 18.43*f./50i;
  i2 = 400./( 9.6+1.286.*(1./x-1) + x2);
  i_2 = abs(i2);
  r = 1.286*(1./x-1);
  output{end+1} = 3*i_2.^2.*r;
end  
    plot(output{1},x,output{2},x,'.-.');
    xlabel('Output power');
    ylabel('Slip');
    legend('50Hz',strcat(num2str(freq),'Hz'));
    grid on;
end