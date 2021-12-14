R = 200;            %radius deðeri(makrocell için):bir hexagonalin merkezinden köþelere olan uzaklýk(m)

%---------7 makrocell'in koordinatlarýnýn x deðerleri---------------
global makrocell_x;
makrocell_x = [(0) 3*R/2 3*R/2 0 (-3*R/2) -3*R/2 0 3*R/2 3*R 3*R 3*R 3*R/2 0 -3*R/2 -3*R -3*R (-3*R) -3*R/2 0 3*R/2 3*R 9*R/2 9*R/2 9*R/2 9*R/2 3*R 3*R/2 0 -3*R/2 -3*R -9*R/2 -9*R/2 -9*R/2 -9*R/2 (-3*R) -3*R/2 0 3*R/2 3*R 9*R/2 6*R 6*R 6*R 6*R 6*R 9*R/2 3*R 3*R/2 0 -3*R/2 -3*R -9*R/2 -6*R -6*R -6*R -6*R -6*R -9*R/2 (-3*R) -3*R/2 0];

%---------7 makrocell'in koordinatlarýnýn y deðerleri-----------------
global makrocell_y;
makrocell_y = [(0) R*sqrt(3)/2 -R*sqrt(3)/2 -2*R*sqrt(3)/2 (-R*sqrt(3)/2) R*sqrt(3)/2 2*R*sqrt(3)/2 3*R*sqrt(3)/2 2*R*sqrt(3)/2 0 -2*R*sqrt(3)/2 -3*R*sqrt(3)/2 -4*R*sqrt(3)/2 -3*R*sqrt(3)/2 -2*R*sqrt(3)/2 0 (2*R*sqrt(3)/2) 3*R*sqrt(3)/2 4*R*sqrt(3)/2 5*R*sqrt(3)/2 4*R*sqrt(3)/2 3*R*sqrt(3)/2 1*R*sqrt(3)/2 -1*R*sqrt(3)/2 -3*R*sqrt(3)/2 -4*R*sqrt(3)/2 -5*R*sqrt(3)/2 -6*R*sqrt(3)/2 -5*R*sqrt(3)/2 -4*R*sqrt(3)/2 -3*R*sqrt(3)/2 -1*R*sqrt(3)/2 1*R*sqrt(3)/2 3*R*sqrt(3)/2 (4*R*sqrt(3)/2) 5*R*sqrt(3)/2 6*R*sqrt(3)/2 7*R*sqrt(3)/2 6*R*sqrt(3)/2 5*R*sqrt(3)/2 4*R*sqrt(3)/2 2*R*sqrt(3)/2 0 -2*R*sqrt(3)/2 -4*R*sqrt(3)/2 -5*R*sqrt(3)/2 -6*R*sqrt(3)/2 -7*R*sqrt(3)/2 -8*R*sqrt(3)/2 -7*R*sqrt(3)/2 -6*R*sqrt(3)/2 -5*R*sqrt(3)/2 -4*R*sqrt(3)/2 -2*R*sqrt(3)/2 0 2*R*sqrt(3)/2 4*R*sqrt(3)/2 5*R*sqrt(3)/2 (6*R*sqrt(3)/2) 7*R*sqrt(3)/2 8*R*sqrt(3)/2];

for i=1:1:makrocell_number
    %hexagonali çizen kod parçasý 
    x_coordinates_makro = [makrocell_x(i)+R/2 makrocell_x(i)-R/2 makrocell_x(i)-R makrocell_x(i)-R/2 makrocell_x(i)+R/2 makrocell_x(i)+R makrocell_x(i)+R/2];
    y_coordinates_makro = [makrocell_y(i)+R*sqrt(3)/2 makrocell_y(i)+R*sqrt(3)/2 makrocell_y(i) makrocell_y(i)-R*sqrt(3)/2 makrocell_y(i)-R*sqrt(3)/2 makrocell_y(i) makrocell_y(i)+R*sqrt(3)/2];      
    
    figure(1)
    hold on;
    plot(x_coordinates_makro,y_coordinates_makro,'- r','linewidth',3);

    %sektörleri çizen kod parçasý
    x_coordinates_makro = [makrocell_x(i) makrocell_x(i)+R/2 makrocell_x(i) makrocell_x(i)+R/2 makrocell_x(i) makrocell_x(i)-R];
    y_coordinates_makro = [makrocell_y(i) makrocell_y(i)+R*sqrt(3)/2 makrocell_y(i) makrocell_y(i)-R*sqrt(3)/2 makrocell_y(i) makrocell_y(i)]; 
    hold on;
    plot(x_coordinates_makro,y_coordinates_makro,'- b');

    %aþaðýdaki kod parçasý hexagonallerin merkez koordinatlarýna baz
    %istasyonu yerleþtirme iþini yapar
    x_coordinates_makro = [makrocell_x(i) makrocell_x(i)];
    y_coordinates_makro = [makrocell_y(i) makrocell_y(i)];
    plot(x_coordinates_makro,y_coordinates_makro,'g','marker','^','linewidth',6);
    text((makrocell_x(i)),(makrocell_y(i)),num2str(i));
    
    %5G baz istasyonlarý
    
    smallcell_5G_x(i, 1) = makrocell_x(i)+R/2;
    smallcell_5G_x(i, 2) = makrocell_x(i)-R/2;
    smallcell_5G_x(i, 3) = makrocell_x(i);
    smallcell_5G_x(i, 4) = makrocell_x(i);
    
    smallcell_5G_y(i, 1) = makrocell_y(i);
    smallcell_5G_y(i, 2) = makrocell_y(i);
    smallcell_5G_y(i, 3) = makrocell_y(i)+R/2;
    smallcell_5G_y(i, 4) = makrocell_y(i)-R/2;
    
    for j=1:1:4
        x_coordinates_5Gcell = [smallcell_5G_x(i, j),smallcell_5G_x(i, j)];
        y_coordinates_5Gcell = [smallcell_5G_y(i, j),smallcell_5G_y(i, j)];
        plot(x_coordinates_5Gcell,y_coordinates_5Gcell,'k','marker','^','linewidth',3);
        text((smallcell_5G_x(i, j)+5),(smallcell_5G_y(i, j)+5),num2str(j));
   
       end
end
%scenario yolu (Y)
yol_main_right_x = [makrocell_x(1)+10 makrocell_x(1)+60];
yol_main_right_y = [makrocell_y(1) makrocell_y(1)+50];
hold on;
plot(yol_main_right_x, yol_main_right_y,'-.k','linewidth',1);
            
yol_main_left_x = [makrocell_x(1) makrocell_x(1)+50];
yol_main_left_y = [makrocell_y(1)+10 makrocell_y(1)+60];
hold on;
plot(yol_main_left_x, yol_main_left_y,'-.k','linewidth',1);

yol_split1_left_x = [makrocell_x(1)+50 makrocell_x(1)+50];
yol_split1_left_y = [makrocell_y(1)+60 makrocell_y(1)+160];
hold on;
plot(yol_split1_left_x, yol_split1_left_y,'-.k','linewidth',1);
            
yol_split1_right_x = [makrocell_x(1)+60 makrocell_x(1)+60];
yol_split1_right_y = [makrocell_y(1)+70 makrocell_y(1)+170];
hold on;
plot(yol_split1_right_x, yol_split1_right_y,'-.k','linewidth',1);

yol_split2_right_x = [makrocell_x(1)+80 makrocell_x(1)+180];
yol_split2_right_y = [makrocell_y(1)+70 makrocell_y(1)+170];
hold on;
plot(yol_split2_right_x, yol_split2_right_y,'-.k','linewidth',1);
            
yol_split2_left_x = [makrocell_x(1)+60 makrocell_x(1)+160];
yol_split2_left_y = [makrocell_y(1)+70 makrocell_y(1)+170];
hold on;
plot(yol_split2_left_x, yol_split2_left_y,'-.k','linewidth',1);

yol_split3_right_x = [makrocell_x(1)+60 makrocell_x(1)+160];
yol_split3_right_y = [makrocell_y(1)+50 makrocell_y(1)+50];
hold on;
plot(yol_split3_right_x, yol_split3_right_y,'-.k','linewidth',1);
            
yol_split3_left_x = [makrocell_x(1)+80 makrocell_x(1)+180];
yol_split3_left_y = [makrocell_y(1)+70 makrocell_y(1)+70];
hold on;
plot(yol_split3_left_x, yol_split3_left_y,'-.k','linewidth',1);



%yol haritasý 
% yol_1_right_x = [makrocell_x(1)+R/2 makrocell_x(1)+R/2];
% yol_1_right_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_1_right_x, yol_1_right_y,'-.k','linewidth',1);
%             
% yol_1_left_x = [makrocell_x(1)+R/2-50 makrocell_x(1)+R/2-50];
% yol_1_left_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_1_left_x, yol_1_left_y,'-.k','linewidth',1);
% 
% yol_2_right_x = [makrocell_x(1)-2*R/3 makrocell_x(1)-2*R/3];
% yol_2_right_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_2_right_x, yol_2_right_y,'-.k','linewidth',1);
% 
% yol_2_left_x = [makrocell_x(1)-2*R/3-50 makrocell_x(1)-2*R/3-50];
% yol_2_left_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_2_left_x, yol_2_left_y,'-.k','linewidth',1);
% 
% yol_3_up_y = [makrocell_y(1)-2*R/3 makrocell_y(1)-2*R/3];
% yol_3_up_x = [makrocell_x(1)-3*R makrocell_x(1)+3*R];
% hold on;
% plot(yol_3_up_x, yol_3_up_y,'-.k','linewidth',1);
%                 
% yol_3_down_y = [makrocell_y(1)-2*R/3-50 makrocell_y(1)-2*R/3-50];
% yol_3_down_x = [makrocell_x(1)-3*R makrocell_x(1)+3*R];
% hold on;
% plot(yol_3_down_x, yol_3_down_y,'-.k','linewidth',1);
% 
% yol_4_up_y = [makrocell_y(1)+2*R/3 makrocell_y(1)+2*R/3];
% yol_4_up_x = [makrocell_x(1)-3*R makrocell_x(1)+3*R];
% hold on;
% plot(yol_4_up_x, yol_4_up_y,'-.k','linewidth',1);
% 
% yol_4_down_y = [makrocell_y(1)+2*R/3-50 makrocell_y(1)+2*R/3-50];
% yol_4_down_x = [makrocell_x(1)-3*R makrocell_x(1)+3*R];
% hold on;
% plot(yol_4_down_x, yol_4_down_y,'-.k','linewidth',1);
%             
% yol_5_right_x = [makrocell_x(1)+4*R/2 makrocell_x(1)+4*R/2];
% yol_5_right_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_5_right_x, yol_5_right_y,'-.k','linewidth',1);
%             
% yol_5_left_x = [makrocell_x(1)+4*R/2-50 makrocell_x(1)+4*R/2-50];
% yol_5_left_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_5_left_x, yol_5_left_y,'-.k','linewidth',1);
% 
% yol_6_right_x = [makrocell_x(1)-5*R/3 makrocell_x(1)-5*R/3];
% yol_6_right_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_6_right_x, yol_6_right_y,'-.k','linewidth',1);
% 
% yol_6_left_x = [makrocell_x(1)-5*R/3-50 makrocell_x(1)-5*R/3-50];
% yol_6_left_y = [makrocell_y(1)-3*R makrocell_y(1)+3*R];
% hold on;
% plot(yol_6_left_x, yol_6_left_y,'-.k','linewidth',1);