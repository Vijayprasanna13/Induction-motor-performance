function pf_power_freq(freq)
    x = 0.001:0.0001:0.012;

    pf = cell(0);
    output = cell(0);

    for f = [50,freq]
      xo = (f./50)*198.688i;
      ro = 2303.16;
      zo = xo*ro/(ro+xo);
      i1 = 400./zo;
      x2 = 18.43*f./50i;
      i2 = 400./( 9.6+1.286.*(1./x-1) + x2); 
      i_2 = abs(i2);
      i = i2+i1;
      pf_angle = -1*angle(i);
      pf{end+1} = cos(pf_angle);
      r = 1.286*(1./x-1);
      output{end+1} = 3*i_2.^2.*r;
    end
    plot(output{1},pf{1},output{2},pf{2},'.-.');
    %plot(output{1}(3700),output{1}(3700));
    xlabel('Output power');
    ylabel('power factor');
    legend('50Hz',strcat(num2str(freq),'Hz'));
    grid on;
end