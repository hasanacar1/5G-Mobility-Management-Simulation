%user
%  users_hm_y = zeros(6, 10);
%  users_hm_x = zeros(6, 10);
% % new_pos_x = [a(2)-1 a(2)-1];
% % new_pos_y = [b(2)-1 b(2)+1];
% % hold on;
% % plot(new_pos_x, new_pos_y, 'k','marker','x','linewidth',2);
% 
% %-------Yoldakiler---------
% %yol 1 deki user
% for i=1:1:5
%     ymin = makrocell_y(1)-3*R;
%     ymax = makrocell_y(1)+3*R;
%     y = ymin+rand()*(ymax-ymin);
%     users_hm_y(1, i)= y;
%     users_hm_x(1, i)= makrocell_x(1)+R/2-25;
%     plot([users_hm_x(1, i), users_hm_x(1, i)], [users_hm_y(1, i),users_hm_y(1, i)], 'r','marker','x','linewidth',2);
% end
% %yol 2 deki user
% for i=1:1:5
%     ymin = makrocell_y(1)-3*R;
%     ymax = makrocell_y(1)+3*R;
%     y = ymin+rand()*(ymax-ymin);
%     users_hm_y(2, i)= y;
%     users_hm_x(2, i)= makrocell_x(1)-2*R/3-25;
%     plot([users_hm_x(2, i), users_hm_x(2, i)], [users_hm_y(2, i),users_hm_y(2, i)], 'r','marker','x','linewidth',2);
% end
% %yol 3 deki user
% for i=1:1:5
%     xmin = makrocell_x(1)-3*R;
%     xmax = makrocell_x(1)+3*R;
%     x = xmin+rand()*(xmax-xmin);
%     users_hm_x(3, i)= x;
%     users_hm_y(3, i)= makrocell_y(1)-2*R/3-25;
%     plot([users_hm_x(3, i), users_hm_x(3, i)], [users_hm_y(3, i),users_hm_y(3, i)], 'r','marker','x','linewidth',2);
% end
% %yol 4 deki user
% for i=1:1:5
%     xmin = makrocell_x(1)-3*R;
%     xmax = makrocell_x(1)+3*R;
%     x = xmin+rand()*(xmax-xmin);
%     users_hm_x(4, i)= x;
%     users_hm_y(4, i)= makrocell_y(1)+2*R/3-25;
%     plot([users_hm_x(4, i), users_hm_x(4, i)], [users_hm_y(4, i),users_hm_y(4, i)], 'r','marker','x','linewidth',2);
% end
% %yol 5 deki user
% for i=1:1:5
%     ymin = makrocell_y(1)-3*R;
%     ymax = makrocell_y(1)+3*R;
%     y = ymin+rand()*(ymax-ymin);
%     users_hm_y(5, i)= y;
%     users_hm_x(5, i)= makrocell_x(1)+4*R/2-25;
%     plot([users_hm_x(5, i), users_hm_x(5, i)], [users_hm_y(5, i),users_hm_y(5, i)], 'r','marker','x','linewidth',2);
% end
% %yol 6 daki user
% for i=1:1:5
%     ymin = makrocell_y(1)-3*R;
%     ymax = makrocell_y(1)+3*R;
%     y = ymin+rand()*(ymax-ymin);
%     users_hm_y(6, i)= y;
%     users_hm_x(6, i)= makrocell_x(1)-5*R/3-25;
%     plot([users_hm_x(6, i), users_hm_x(6, i)], [users_hm_y(6, i),users_hm_y(6, i)], 'r','marker','x','linewidth',2);
% end
% 
% %------Durgun halde olanlar-------users_nm
% users_nm_y = zeros(15);
% users_nm_x = zeros(15);
% for i=1:1:15
%     users_nm_y(i) = -3*R + 6*R*rand();
%     users_nm_x(i) = -3*R + 6*R*rand();
%     while ((makrocell_x(1)+R/2>users_nm_x(i))&&(makrocell_x(1)+R/2-50<users_nm_x(i)))||((makrocell_x(1)-2*R/3>users_nm_x(i))&&(makrocell_x(1)-2*R/3-50<users_nm_x(i)))||((makrocell_y(1)-2*R/3>users_nm_y(i))&&(makrocell_y(1)-2*R/3-50<users_nm_y(i)))||((makrocell_y(1)+2*R/3>users_nm_y(i))&&(makrocell_y(1)+2*R/3-50<users_nm_y(i)))||((makrocell_x(1)+4*R/2>users_nm_x(i))&&(makrocell_x(1)+4*R/2-50<users_nm_x(i)))||((makrocell_x(1)-5*R/3>users_nm_x(i))&&(makrocell_x(1)-5*R/3-50<users_nm_x(i)))
%         users_nm_y(i) = -3*R + 6*R*rand();
%         users_nm_x(i) = -3*R + 6*R*rand();
%     end
%     plot([users_nm_x(i), users_nm_x(i)], [users_nm_y(i),users_nm_y(i)], 'b','marker','x','linewidth',2);
% 
% end
% 
% %------Yavaþ hareket halindeki yayalar-------users_sm(slow mobility)
% users_nm_y = zeros(15);
% users_nm_x = zeros(15);
% for i=1:1:2
%     users_nm_y(i) = -R/2 + R*rand();
%     users_nm_x(i) = R/2 +  R*rand();
%     while ((makrocell_x(1)+R/2>users_nm_x(i))&&(makrocell_x(1)+R/2-50<users_nm_x(i)))||((makrocell_x(1)-2*R/3>users_nm_x(i))&&(makrocell_x(1)+2*R/3-50<users_nm_x(i)))||((makrocell_y(1)-2*R/3>users_nm_y(i))&&(makrocell_y(1)-2*R/3-50<users_nm_y(i)))||((makrocell_y(1)+2*R/3>users_nm_y(i))&&(makrocell_y(1)+2*R/3-50<users_nm_y(i)))||((makrocell_x(1)+4*R/2>users_nm_x(i))&&(makrocell_x(1)+4*R/2-50<users_nm_x(i)))||((makrocell_x(1)-5*R/3>users_nm_x(i))&&(makrocell_x(1)-5*R/3-50<users_nm_x(i)))
%         users_nm_y(i) = -R/2 + R*rand();
%         users_nm_x(i) = -R/2 + R*rand();
%     end
% 
% end

users_nm_y(1, 1) = 0;
users_nm_x(1, 1) = 0;

users_nm_y(2, 1) = 0;
users_nm_x(2, 1) = 0;

users_nm_y(3, 1) = 0;
users_nm_x(3, 1) = 0;

% users_nm_y(1) = 0;
% users_nm_x(1) = R/2 ;


