%futures of antennas and cells
f = 28 ;%5G frequency band in GHz
c = 3 * 10^8 ; %speed of light
TXgain = 24.5; %when transmitter height 17 meter 
RXgain = 0; %when receiver height 1.5 meter
TXpower = 10;% transmitter power dB -->kontrol edilecek
shadowing=8;%dB
k_constant = 1.38 * 10^(-23); %baltzman constant
T_kelvin = 290; %temperature in Kelvin
noise_figure = 7.9433;
Bandwidth = 500 * 10^6 ;%MHz
delta_HOM_max = 2; 
HOM_max = 3; %max handover margin
HOM_min = 2; %max handover margin
TTT = 1 ;% actually 3, 4 dB. we minimize it for focusing HOM
