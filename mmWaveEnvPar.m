function Env = mmWaveEnvPar(d, p)
    Env.type = 1;
    Env.nSim = 1000;
    Env.average_BS = 20; %Average number of BS in a network = avg cell radius   
    Env.density_BS = d;
    %Env.density_BS = 1/(pi*20^2);
    %Env.density_UE = 1/(pi*100^2);
    Env.density_UE = 1/(pi*100^2);
    %Env.lambdaParent = Env.density_BS;
    %Env.ISD = 1./(2*sqrt(Env.density_BS))*2.3;
    
    Env.abs = [0, 0];
    Env.alpha = [2, 4]; %pathloss exponent
    Env.theta_b = 10/180;
    Env.theta_u = 360/180;
    
    Env.Gb = 18; 
    Env.Gu = 0;
    Env.gb = -2;
    Env.gu = 0;
    
    %Env.antenna_t = [10^(Gb/10), 10^(Gb/10)*xi_b, 10/180*pi];
    %Env.antenna_r = [10^(Gu/10), 10^(Gu/10)*xi_u, 360/180*pi];

    Env.freq = 28*10^9;
    Env.tau = 141.4;
    %Env.K = 10^(-61.38/10);
    %Env.K = (3*10^8/(4*pi*Env.freq))^2;
    Env.K = 10^(-61.38/10);
    Env.nakagami_M = [3, 2];
    
    Env.noise_density = -174;
    Env.W = 100*1e+6;
    Env.p = p;
    Env.sigma_dBm = Env.noise_density + 10*log10(Env.W) -Env.p + 10;
    %Env.sigma_dBm = Env.noise_density + 10*log10(Env.W) + 10;
    Env.sigma = 10^(Env.sigma_dBm/10);


end