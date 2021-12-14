noise  =  (10 * log10(k_constant*T_kelvin*noise_figure*Bandwidth)) + 30 ; % Noise for user j at time k=1

interference_makrocell(t, u) = RSP_makrocell(sorted_RSP_makrocell(2)) + RSP_makrocell(sorted_RSP_makrocell(3));

SNR_makrocell(t, u) = RSP_makrocell(sorted_RSP_makrocell(1)) - noise;

SINR_makrocell(t, u) = RSP_makrocell(sorted_RSP_makrocell(1)) + interference_makrocell(t, u) - noise;  


