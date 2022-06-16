%getting data from user
freq = input('Sampling frequency of the siganl: ');
ti = input ('Start time of the siganl: ');
tf = input ('End time of the signal: ');
breakpoints = input ('Number of breakpoints: ');
BP_timestamps = zeros(1,breakpoints);
t_com=0;ystart=0;yend=0;
signal=[];
for i=1:1:breakpoints
BP_timestamps(1,i) = input ('enter the time of the corresponding timestamp: ');
end
sprintf ('you need to enter the specifications of the signal over each period as following :\n1:DC signal\n2:Ramp signal\n3:General ploynomial\n4:Exponential\n5:Sinusoidal')
for i=1:1:breakpoints+1
      type_index = input ('The equivalent index for the type of signal: ');
      ts = [ti BP_timestamps tf]; 
      t = linspace(ts(i) , ts(i+1) ,(ts(i+1) - ts(i)) * freq); 
           if (type_index == 1) 
                amp = input('Amplitude= ');
                y = amp * ones(1,(ts(i+1) - ts(i))*freq);
                figure (1)
                ystart =y(1);
                plot ([t_com t_com] , [ystart yend])
                t_com =t(end);yend =y(end);
                plot (t,y) 
                hold on ; grid on;grid minor
           end
           if(type_index == 2) 
               a = input('slope=');
               b = input ('intercept= ');
               y = a*t+b;
               ystart =y(1);
               plot ([t_com t_com] , [ystart yend])
               t_com =t(end);yend =y(end);
               plot (t,y)
               hold on ; grid on; grid minor
           end
           if(type_index == 3)
               max_pow = input ('Highest power in the equation= ');
               intercept = input ('intercept = ');
               y = 0 ;
               coeff = zeros(1,max_pow);
               coeff= input ('coeffecients as follwoing [1 2 3 ...]= ');
               for (j=1:1:max_pow)
                   yj = coeff(j) * t.^j;
                   y = y+yj;
               end
               y = y+intercept;
               ystart =y(1);
               plot ([t_com t_com] , [ystart yend])
               t_com =t(end);yend =y(end);
               plot (t,y)
               hold on ; grid on;grid minor
           end
           if (type_index == 4)
               Amp = input('Amplitude= ');
               ex= input('Exponent= ');
               y=Amp * exp(ex*t);
               ystart =y(1);
               plot ([t_com t_com] , [ystart yend])
               t_com =t(end);yend =y(end);
               plot (t,y)
               hold on ; grid on; grid minor
           end
           if (type_index == 5)
              Amplitude = input('Amplitude= ');
              sinFreq = input('Frequency= ');
              phase= input('phase( °)= ');
              y= Amplitude* sin(2*pi*sinFreq*t + phase*pi/180);
              ystart =y(1);
              plot ([t_com t_com] , [ystart yend])
              t_com =t(end);yend =y(end);
              plot (t,y)
              hold on ; grid on;grid minor
           end
           signal=[signal y];
end

 t = linspace(ti , tf ,(tf-ti) * freq);
 opp=input('do you want to perfrom any operatoin on the signal? \npress 1 for yes\npress 2 for no\n ');
 if(opp==2)
 sprintf('thank you')
 end
 if (opp==1)
 Number_of_operations=input('Enter number of operations you want');
 if(Number_of_operations>0)
 for i=1:Number_of_operations
 
sprintf ('kindly choose one of the following operations :\n1:Amplitude Scaling\n2:Time reversal\n3:Time shift\n4:Expanding the signal\n5:Compressing the signal')
 n = input('Enter the number of the desired operation: ');
modified_signal=signal;
switch n
    case 1
scale = input('Enter the scale value: ');
modified_signal=scale*modified_signal;
    case 2
 t = linspace(-tf , -ti ,(tf-ti) * freq);
 reversing=modified_signal;
 for i=1:1:(tf-ti)*freq
    modified_signal(i)=reversing(end-(i-1)); 
 end
    case 3
     shift= input('Enter the time shift value: ');
 t = linspace(ti-shift , tf-shift ,(tf-ti) * freq);
    case 4
expand = input('Enter the reciprocal of the coeffecient of t: ');
 t = linspace(ti*expand , tf*expand ,(tf-ti)*freq);
    case 5
        compress= input('Enter the coeffecient of t: ');
         t = linspace(ti/compress , tf/compress ,(tf-ti)* freq);
end
figure;
 plot(t,modified_signal)
 grid on; grid minor;
 end
 end
 end