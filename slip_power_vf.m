function slip_power_vf(vf)
    x = 0.0001:0.001:0.013;
    output = cell(0);
    cat = strcat(num2str(vf{1}),'V,',num2str(vf{2}),'Hz');
    for vf = {{400,50},vf}
      x2 = 18.43i*vf{end}{2}./50;
      i2 = vf{end}{1}./( 9.6+1.286.*(1./x-1) + x2);
      i_2 = abs(i2);
      r = 1.286*(1./x-1);
      output{end+1} = 3*i_2.^2.*r;
    end  
    plot(output{1},x,output{2},x,'.-.');
    xlabel('Output power');
    ylabel('Slip');
    legend('400V,50Hz',cat);
    grid on;
end