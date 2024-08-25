clear; clc;
%density_BS = [1e-6,2.5e-6,5e-6,7.5e-6,1e-5,2.5e-5,5e-5,7.5e-5,1e-4,2.5e-4,5e-4,7.5e-4,1e-3,2.5e-3,5e-3,7.5e-3,1e-2,2.5e-2,5e-2,7.5e-2,1e-1];%,2.5e-1,5e-1,7.5e-1];
density_BS =1/(pi*100^2);
%profile on ;
Tx = 15;
spectrum = 1; %% 0 for sub 6 GHz, 1 for mmWave and 2 for THz
for i = 1:length(Tx)
    disp(['Running simulation for Tx = ' num2str(Tx(i))]);
    p = Tx(i);
    for j = 1:length(density_BS) 
        disp(['Running simulation for density_BS = ' num2str(density_BS(j))]);
        totalProb = [];
        d = density_BS(j);
        if spectrum == 0
            Env = sub6GHzEnvPar(d, p);
        end
        if spectrum == 1
            Env = mmWaveEnvPar(d, p);
        end
        if spectrum == 2
            Env = THzEnvPar(d, p); 
        end    
        total_SINR = [];
        SINR_SI = [];
        Env = numCell(Env);
        nMain = [];
        parfor i_sim = 1: Env.nSim
             
            [NtWk] = cellDeploy(i_sim,Env);
            [NtWk] = cell_connection(i_sim, Env, NtWk);
            [NtWk] = calc_SINR(i_sim, Env, NtWk);
            total_SINR = [total_SINR; NtWk.SINR_dB(:, 1)]; %SINR of all UEs.
            SINR_SI = [SINR_SI; NtWk.SINR(:, 1)];
            nMain = [nMain; Env.nMainBS(:, 1)];
        end
        
    end 
end 

[ycdf, xcdf] = cdfcalc(total_SINR);
SINR = [xcdf, 1-ycdf(1:end-1)];

figure(10), plot(SINR(:, 1), SINR(:, 2)); %  , '-s', 'MarkerIndices',1:1000:length(SINR(:, 2)));
title('Simulated SINR CCDF');
xlabel('SINR threshold in dB'), ylabel('SINR Coverage Probability');
xlim([-10, 24]), ylim([0, 1]);
grid on;
hold on;
%}

