function Env = THzEnvPar(d, p)
    %Env.k = k;
    Env.nSim = 10000;
    Env.type = 1;
    Env.average_BS = 20; %Average cell radius
    Env.density_BS = d;
    %Env.density_BS = 1/(pi*20^2);
    Env.density_UE = 1/(pi*100^2);
    Env.lambdaParent = Env.density_BS;
    Env.ISD = 1./(2*sqrt(Env.density_BS))*2.3;

    %Env.abs = [0.005, 0.5];
    Env.abs = [0.005, 0.005];
    Env.alpha = [2, 4]; %pathloss exponent

    Env.theta_b = 3.17/180*pi;
    Env.theta_u = 25.3/180*pi; %%Sharp UE beam
    %Env.theta_u = 360/180*pi;  %%Omni UE beam
    Env.Gu = 18.79;  %Sharp UE main lobe beam gain
    Env.gu = -11.21;  %Sharp UE side lobe beam gain
    %Env.Gu = 0;  %Omni UE beam
    %Env.gu = 0;  %Omni UE beam
    Env.Gb = 35.35; 
    Env.gb = -4.65;

 
    %Env.tau = 141.4;
    Env.tau = 50;
   
    Env.nakagami_M = [3, 2];
    Env.freq = 300*10^9;
    Env.K = (3*10^8/(4*pi*Env.freq))^2;
    
    Env.noise_density = -174;
    Env.W = 250*1e+6;
    
    Env.p = p;
    Env.sigma_dBm = Env.noise_density + 10*log10(Env.W) -Env.p+ 10;
    Env.sigma = 10^(Env.sigma_dBm/10);


end