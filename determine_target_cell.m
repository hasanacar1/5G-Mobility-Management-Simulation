% if (SINR_A(t, u)>SINR_B(t, u)) && (SINR_A(t, u)>SINR_C(t, u)) && (SINR_A(t, u)>SINR_smallcell(t, u))
%     target_maincell(t, u) = "main cell: " + num2str(sorted_RSP_A(1));
%     target_subcell(t, u) = "A sector";
%     target_SINR(t, u) = SINR_A(t, u);
% elseif (SINR_B(t,u)>SINR_A(t, u)) &&  (SINR_B(t, u)>SINR_C(t, u)) && (SINR_B(t, u)>SINR_smallcell(t, u))
%     target_maincell(t, u) = "main cell: " + num2str(sorted_RSP_B(1));
%     target_subcell(t, u) = "B sector";
%     target_SINR(t, u) = SINR_B(t, u);
% elseif (SINR_C(t, u)>SINR_A(t, u)) &&  (SINR_C(t, u)>SINR_B(t, u)) && (SINR_B(t, u)>SINR_smallcell(t, u))
%     target_maincell(t, u) = "main cell: " + num2str(sorted_RSP_C(1));
%     target_subcell(t, u) = "C sector";
%     target_SINR(t, u) = SINR_C(t, u);
% elseif (SINR_smallcell(t, u)>SINR_A(t, u)) &&  (SINR_smallcell(t, u)>SINR_B(t, u)) && (SINR_smallcell(t, u)>SINR_C(t, u))
%     target_maincell(t, u) = "controlcell : " + num2str(smallcell_M(t, u));
%     target_subcell(t, u) = "Smallcell: "+num2str(smallcell_s(t, u));
%     target_SINR(t, u) = SINR_smallcell(t, u);
% end

target_maincell(t, u) = sorted_RSP_smallcell_M(1);
target_subcell(t, u) = sorted_RSP_smallcell_s(1);
target_RSP(t, u) = RSP_smallcell(sorted_RSP_smallcell_M(1), sorted_RSP_smallcell_s(1), t, u);

if t==1
    served_maincell(t, u) = target_maincell(t, u);
    served_subcell(t, u) = target_subcell(t, u);
    
    served_maincell(t+1, u) = target_maincell(t, u);
    served_subcell(t+1, u) = target_subcell(t, u);
    
    duration = 0;
    HOM(t) = 2;
    HOM(t+1) = 2;
else
    if (RSP_smallcell(target_maincell(t, u), target_subcell(t, u), t, u) > RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u) + HOM(t)) && (target_maincell(t, u) == target_maincell(t-1, u)) && (target_subcell(t, u) == target_subcell(t-1, u))
        duration = duration + 1;
        served_maincell(t+1, u) = served_maincell(t, u);
        served_subcell(t+1, u) = served_subcell(t, u);
        
    elseif (RSP_smallcell(target_maincell(t, u), target_subcell(t, u), t, u) > RSP_smallcell(served_maincell(t, u), served_subcell(t, u), t, u) + HOM(t)) && ((target_maincell(t, u) ~= target_maincell(t-1, u)) || (target_subcell(t, u) ~= target_subcell(t-1, u)))
        duration = 1;
        served_maincell(t+1, u) = served_maincell(t, u);
        served_subcell(t+1, u) = served_subcell(t, u);
    else
        duration = 0;
        served_maincell(t+1, u) = served_maincell(t, u);
        served_subcell(t+1, u) = served_subcell(t, u);
    end
end
if duration == TTT
    duration = 0;
    served_maincell(t, u) = target_maincell(t, u);
    served_subcell(t, u) = target_subcell(t, u);
    
    served_maincell(t+1, u) = target_maincell(t, u);
    served_subcell(t+1, u) = target_subcell(t, u);
    
    total_handover(u, t+1) = total_handover(u, t) + 1;
else
    total_handover(u, t+1) = total_handover(u, t);
end