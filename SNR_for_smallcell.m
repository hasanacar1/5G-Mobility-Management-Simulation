noise  =  (10 * log10(k_constant*T_kelvin*noise_figure*Bandwidth)) + 30 ;
SINR_smallcell(t, u) = RSP_smallcell(sorted_RSP_smallcell_M(1), sorted_RSP_smallcell_s(1), t, u) - noise;



makro(t,u) = sorted_RSP_smallcell_M(1);
for s=1:1:4
    control_plane(s, t, u) = RSP_smallcell(sorted_RSP_smallcell_M(1), s, t, u);
end
    
