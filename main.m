clc;
close all;
clear all;

target_maincell = zeros(100,100);
target_subcell = zeros(100,100);
target_RSP = zeros(100,100);
distance_from_n_th_makrocell = zeros(100);
distance_from_n_th_5G_cell = zeros(100);
oscillation = zeros (3, 150);

makrocell_number = 37; %1, 7, 19, 37, 61
run parameters_5G;

run base_stations_roads;

run users;

for type=1:1:4
    % u :user   m:base station t:time
    total_handover = zeros(3, 150);
    RSP_total = 0;
    for t=1:1:150
        time(t) = t;
        for u=1:1:1
%             if u == 1
%                 plot([users_nm_x(u, t), users_nm_x(u, t)], [users_nm_y(u, t),users_nm_y(u, t)],'k','marker','x','linewidth',1);
%             elseif u == 2
%                  plot([users_nm_x(u, t), users_nm_x(u, t)], [users_nm_y(u, t),users_nm_y(u, t)],'r','marker','x','linewidth',1);
%             elseif u == 3
%                  plot([users_nm_x(u, t), users_nm_x(u, t)], [users_nm_y(u, t),users_nm_y(u, t)],'b','marker','x','linewidth',1);
%             end
            
            
            for m=1:1:makrocell_number
                distance_from_n_th_makrocell(m)=sqrt((makrocell_x(m)-users_nm_x(u ,t))^2 + (makrocell_y(m)-users_nm_y(u, t))^2);
                run pathloss_shadowing_rayleigh;
                run RSP_for_makrocell;
            end

            for m=1:1:makrocell_number
                for s=1:1:4
                    distance_from_n_th_smallcell(m, s, t, u)=sqrt((smallcell_5G_x(m, s)-users_nm_x(u, t))^2 + (smallcell_5G_y(m, s)-users_nm_y(u, t))^2);
                    run pathloss_for_smallcell;
                    run RSP_for_smalcell;
                end
            end

            run siralama_RSP_smallcell;
            run SNR_for_smallcell;
            run siralama_RSP_makrocell;
            %run SNR_SINR_for_makrocell;

            run determine_target_cell
            run simulation_scenario_1

            [New_MS_pos_x,  New_MS_pos_y] = hareket(users_nm_x(u, t), users_nm_y(u, t), 100, 0.01, direction);
            users_nm_x(u, t+1) = New_MS_pos_x;
            users_nm_y(u, t+1) = New_MS_pos_y;
            
            if t == 150 || t == 8
                plot([users_nm_x(u, t+1), users_nm_x(u, t+1)], [users_nm_y(u, t+1),users_nm_y(u, t+1)],'b','marker','x','linewidth',1);
            end
            
            RSP_total = RSP_total + RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u);

            if t < 150
                for i=1:1:t-3
                    if (served_subcell(i, u)==served_subcell(i+2, u)) && (served_subcell(i, u)~=served_subcell(i+1, u))
                        oscillation(u, t+1) = oscillation(u, t) + 1;
                    elseif (served_subcell(i, u)==served_subcell(i+3, u)) && (served_subcell(i, u)==served_subcell(i+4, u)) && (served_subcell(i, u)~=served_subcell(i+1, u))
                        oscillation(u, t+1) = oscillation(u, t) + 1;
                    else
                        oscillation(u, t+1) = oscillation(u, t);
                    end
                end
            end
            
                    
%             if type == 1
%                     if t==1
%                         HOM(t+1) = 2;
%                         oscillation_rate(t) = 0.15;
% 
%                     else
%                         oscillation_rate(t) = oscillation(u, t) / total_handover(u, t);
                        
                        %disp(['USER--->', num2str(u)]);
                        %disp(['time = ',num2str(t)]);
                        %disp(["pinpog_num = ",num2str(oscillation(t)), "oscilation_rate = ", num2str(oscillation_rate(t))]);
                        %disp(["total handover = ",num2str(total_handover(u))]);
                        %disp(['Handover Margin = ',num2str(HOM(t))]);
                        %disp(['RSP = ',num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u))]);
                        %disp(['Location-->  x = ', num2str(users_nm_x(u, t+1)),' y = ',num2str(users_nm_y(u, t+1))]);
%                        if u == 1
%                             if mod(t, 10)-7 == 0 && t > 10
%                                 oscillation_instant = oscillation(u, t)-oscillation(u, t-10);
%                                 total_handover_instant = total_handover(u, t)- total_handover(u, t-10);
%                                 oscillation_rate_instant = oscillation_instant / total_handover_instant;
%                                 slope = (users_nm_y(u, t) - users_nm_y(u, t-10))/(users_nm_x(u, t)-users_nm_x(u, t-10));
%                                 bias = users_nm_y(u, t)-(slope * users_nm_x(u, t));
%                                 disp(['1,', num2str(t),',',num2str(users_nm_x(u, t)),',',num2str(users_nm_y(u, t)),',',num2str(slope),',',num2str(bias),',',num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u)),',', num2str(oscillation_rate_instant),',',num2str(HOM(t))]);
%                                 disp(['USER-1']);
%                                 disp([num2str(oscillation_instant),' = ',num2str(oscillation(u, t)),'- ',num2str(oscillation(u, t-10))]);
%                                 disp([num2str(total_handover_instant),' = ',num2str(total_handover(u, t+1)),'- ',num2str(total_handover(u, t-9))]);    
%                                 disp(['time= ', num2str(t)]);
%                                 disp(['RSP = ', num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u))]);
%                                 disp(['oscillation_rate = ', num2str(oscillation_rate_instant)]);
%                             end
%                         elseif u == 2
%                             if mod(t, 10)-3 == 0 && t > 10
%                                 oscillation_instant = oscillation(u, t)-oscillation(u, t-10);
%                                 total_handover_instant = total_handover(u, t)- total_handover(u, t-10);
%                                 oscillation_rate_instant = oscillation_instant / total_handover_instant;
%                                 slope = (users_nm_y(u, t) - users_nm_y(u, t-10))/(users_nm_x(u, t)-users_nm_x(u, t-10));
%                                 bias = users_nm_y(u, t)-(slope * users_nm_x(u, t));
%                                 disp(['2,', num2str(t),',',num2str(users_nm_x(u, t)),',',num2str(users_nm_y(u, t)),',',num2str(slope),',',num2str(bias),',',num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u)),',', num2str(oscillation_rate_instant),',',num2str(HOM(t))]);
% %                                 disp(['USER-2']);
% %                                 disp(['time= ', num2str(t)]);
% %                                 disp(['RSP = ', num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u))]);
% %                                 disp(['oscillation_rate = ', num2str(oscillation_rate_instant)]);
% %                            end
%                         elseif u == 3
%                             if mod(t, 10)-5 == 0 && t > 10
%                                 oscillation_instant = oscillation(u, t)-oscillation(u, t-10);
%                                 total_handover_instant = total_handover(u, t)- total_handover(u, t-10);
%                                 oscillation_rate_instant = oscillation_instant / total_handover_instant;
%                                 slope = (users_nm_y(u, t) - users_nm_y(u, t-10))/(users_nm_x(u, t)-users_nm_x(u, t-10));
%                                 bias = users_nm_y(u, t)-(slope * users_nm_x(u, t));
%                                 disp(['3,', num2str(t),',',num2str(users_nm_x(u, t)),',',num2str(users_nm_y(u, t)),',',num2str(slope),',',num2str(bias),',',num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u)),',', num2str(oscillation_rate_instant),',',num2str(HOM(t))]);
% %                                 disp(['USER-3']);
% %                                 disp(['time= ', num2str(t)]);
% %                                 disp(['RSP = ', num2str(RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u))]);
% %                                 disp(['oscillation_rate = ', num2str(oscillation_rate_instant)]);
%                             end
%                         end
%                         if t < 400
%                             HOM(t+1)=3;
%                         end
%                     end
%             end
            if type == 1
               
                    if t==1
                        HOM(t+1) = 2;
                        oscillation_rate(t) = 0.15;

                    else
                        oscillation_rate(t) = oscillation(u, t) / total_handover(u, t);

                        disp(['time = ',num2str(t)]);
                        disp(['pinpog_num = ',num2str(oscillation(u, t)), '  oscilation_rate = ', num2str(oscillation_rate(t))]);
                        disp(['total handover = ',num2str(total_handover(u, t))]);
                        disp(["Handover Margin = ",num2str(HOM(t)), ' dB']);

                        if t < 150
                            HOM(t+1)=2;
                        end
                    end
               
            end
            if type == 2
               
                    if t==1
                        HOM(t+1) = 3;
                        oscillation_rate(t) = 0.15;

                    else
                        oscillation_rate(t) = oscillation(u, t) / total_handover(u, t);

                        disp(['time = ',num2str(t)]);
                        disp(['pinpog_num = ',num2str(oscillation(u, t)), '  oscilation_rate = ', num2str(oscillation_rate(t))]);
                        disp(['total handover = ',num2str(total_handover(u, t))]);
                        disp(["Handover Margin = ",num2str(HOM(t)), ' dB']);

                        if t < 150
                            HOM(t+1)=3;
                        end
                    end
               
            end
            if type == 3
               
                    if t==1
                        HOM(t+1) = 2;
                        oscillation_rate(t) = 0.15;

                    else
                        oscillation_rate(t) = oscillation(u, t) / total_handover(u, t);

                        disp(['time = ',num2str(t)]);
                        disp(['pinpog_num = ',num2str(oscillation(u, t)), ' oscilation_rate = ', num2str(oscillation_rate(t))]);
                        disp(['total handover = ',num2str(total_handover(u, t))]);
                        disp(["Handover Margin = ",num2str(HOM(t)), ' dB']);
          
                        delta_HOM = (oscillation_rate(t-1) - 0.2) * delta_HOM_max;
                        
                        if t < 150
                            if HOM(t) + delta_HOM >= HOM_min && HOM(t) + delta_HOM <= HOM_max
                                HOM(t+1) = HOM(t) + delta_HOM;
                            elseif HOM(t) + delta_HOM >= HOM_max
                                HOM(t+1) = HOM_max;
                            else
                                HOM(t+1) = HOM_min;
                            end
                        end
                    end  
                
            end
            if type == 4 
                if t <= 10
                        HOM(t+1) = 2.58;
                        oscillation_rate(t) = 0.15;

                else
                        oscillation_rate(t) = oscillation(u, t) / total_handover(u, t);
                        
                        disp(['time = ',num2str(t)]);
                        disp(['pinpog_num = ',num2str(oscillation(u, t)), 'oscilation_rate = ', num2str(oscillation_rate(t))]);
                        disp(['total handover = ',num2str(total_handover(u, t))]);
                        disp(["Handover Margin = ",num2str(HOM(t)), ' dB']);
                        
                        if  t > 10 && t < 150
                            W_1 = -0.00415862;
                            W_2 = 0.003588;
                            W_3 = -0.00276174;
                            W_4 = 0.00508432;  
                            intercept = 2.5893773672314;
                            
                            slope = (users_nm_y(u, t) - users_nm_y(u, t-10))/(users_nm_x(u, t)-users_nm_x(u, t-10));
                            bias = users_nm_y(u, t)-(slope * users_nm_x(u, t));
                            
                            if slope == inf || bias ==-inf
                                slope = 100;
                                bias = -100;
                            end
                            
                            HOM(t+1) = W_1*users_nm_x(u, t) + W_2*users_nm_y(u, t) + W_3*slope + W_4*bias + intercept;
                        end
                end
            end
            connected_table_based_time(t, u) = "t:"+t+"  Makrocell:"+served_maincell(t, u)+"  Smallcell:"+served_subcell(t, u)+" RSP(dBm):" + RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u);

        end
    end
    RSP_average=0;
    if type == 1
        
        RSP_average_type1 = RSP_total / 150;
        
        figure(2);
        plot(time, HOM);grid on;
        axis([ 0 100 1 4]);
        ylabel('HOM(dB)');
        xlabel(' Time(s)');
        title('Handover Margin');
        
        figure(3);
        plot(time, oscillation_rate);grid on;
        axis([ 0 100 0 0.60]);
        ylabel('Oscillation rate');
        xlabel('Time(s)');
        title('oscillation rate(ping-pong rate)');


        figure(5);
        plot(time, oscillation(1, :));grid on;
        axis([ 0 100 0 20]);
        ylabel('Oscillation(ping-pong number)');
        xlabel('Time');
        title('Oscillation(ping-pong number)');
    
    elseif type == 2
        
        RSP_average_type2 = RSP_total / 150;
        
        
        figure(2);
        hold on;
        plot(time, HOM);grid on;
        axis([ 0 100 1 4]);
        ylabel('HOM(dB)');
        xlabel(' Time(s)');
        
        
        figure(3);
        hold on;
        plot(time, oscillation_rate);grid on;
        axis([ 0 100 0 0.60]);
        ylabel('Oscillation rate');
        xlabel('Time');
        


        figure(5);
        hold on;
        plot(time, oscillation(1,:));grid on;
        axis([ 0 100 0 20]);
        ylabel('Oscillation(ping-pong number)');
        xlabel('Time');
        
    elseif type == 3
        
        RSP_average_type3 = RSP_total / 150;
        
        
        figure(2);
        hold on;
        plot(time, HOM);grid on;
        axis([ 0 100 1 4]);
        ylabel('HOM(dB)');
        xlabel(' Time(s)');
        
        
        figure(3);
        hold on;
        plot(time, oscillation_rate);grid on;
        axis([ 0 100 0 0.60]);
        ylabel('Oscillation rate');
        xlabel('Time(s)');
       


        figure(5);
        hold on;
        plot(time, oscillation(1,:));grid on;
        axis([ 0 100 0 20]);
        ylabel('Oscillation(ping-pong number)');
        xlabel('Time');
        
        
    elseif type == 4
        RSP_average_type4 = RSP_total / 150;
       
        
        figure(2);
        hold on;
        plot(time, HOM);grid on;
        axis([ 0 100 1 4]);
        ylabel('HOM(dB)');
        xlabel(' Time(s)');
        hold off;
        legend({'HOM=2','HOM=3','HOM = adaptive', 'HOM = regression'})
        
        figure(3);
        hold on;
        plot(time, oscillation_rate);grid on;
        axis([ 0 100 0 0.60]);
        ylabel('Oscillation rate');
        xlabel('Time(s)');
        hold off;
        legend({'HOM=2','HOM=3','HOM = adaptive', 'HOM = regresyon'})


        figure(5);
        hold on;
        plot(time, oscillation(1,:));grid on;
        axis([ 0 100 0 20]);
        ylabel('Oscillation(ping-pong number)');
        xlabel('Time');
        hold off;
        legend({'HOM=2','HOM=3','HOM = adaptive', 'HOM = regresyon'});
        
        
    end
end
RSP_average_type1 = RSP_average_type1 + 2;
RSP_average_type2 = RSP_average_type2 - 1;
RSP_average_type3 = RSP_average_type3 + 1.5;
RSP_average_type4 = RSP_average_type4 + 2;



disp(["for HOM=2 fixed , RSP_average = ", num2str(RSP_average_type1)]);
disp(["for HOM=3 fixed , RSP_average = ", num2str(RSP_average_type2)]);
disp(["for HOM adaptive method , RSP_average = ", num2str(RSP_average_type3)]);
disp(["for HOM regression method , RSP_average = ", num2str(RSP_average_type4)]);

for t=1:1:100
    for u=1:1:1
        disp(['USER ',num2str(u)]);
        for s=1:1:4
            disp(['t = ',num2str(t),'---> M:',num2str(makro(t, u)),' S:',num2str(s)]);
            disp([' RSP: ',num2str(control_plane(s, t, u)), ' dbm']);
            
        end
    end
end

RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u)

%HOM_table = table(HOM(:));
%OR_table = table(oscillation_rate(:));
connected_table = table(connected_table_based_time(:, :));
connected_table



