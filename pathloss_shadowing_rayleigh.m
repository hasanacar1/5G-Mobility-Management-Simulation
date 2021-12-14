%For example, the command below creates a channel object representing a Rayleigh fading channel that acts on a signal sampled at 100,000 Hz. The maximum Doppler shift of the channel is 130 Hz.

path_loss_dB(m) = 79.2 + 26*log10(distance_from_n_th_makrocell(m));
path_loss_shadowing_dB(m) = 79.2 + 26*log10(distance_from_n_th_makrocell(m)) + round(8*rand())-round(8*rand()) ;
%path_loss_rayleigh_dB(k, m) = 79.2 + 26*log10(distance_from_n_cell(k, m)) + round(8*rand())-round(8*rand()) + rayleigh_channel;



