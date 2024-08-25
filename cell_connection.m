function [NtWk] = cell_connection(i_sim, Env, NtWk)
    % BS-UE association
    if Env.type == 2  %For matern hardcore type 2
        Env.nBS(i_sim, 1) = NtWk.nBS(i_sim, 1);
        Env.nMainBS(i_sim, 1) = NtWk.nMainBS(i_sim, 1);
    end    
    NtWk.distance = abs(kron(NtWk.posUE, ones(1, Env.nBS(i_sim, 1))) - kron(NtWk.posBS.', ones(Env.nUE(i_sim, 1), 1)));
    [pathloss_Exp, abs_coeff] = func_LN(i_sim, Env, NtWk);
    pathloss = NtWk.distance.^(-pathloss_Exp).*exp(-abs_coeff.*NtWk.distance);
    NtWk.pathgain = Env.K.*pathloss;

    % Connect UE to nearest BS
    [~, NtWk.sortBS_des] = sort(pathloss, 2, 'descend'); %sort matrix rows in descending order.
    NtWk.list_mainUE = find(NtWk.sortBS_des(:, 1) < Env.nMainBS(i_sim, 1) + 1); %returns the linear indicesX of the nonzero elements. 
    NtWk.nMainUE = length(NtWk.list_mainUE);
    NtWk.servingBS_des = NtWk.sortBS_des(NtWk.list_mainUE, 1); % indices of the serving BSs for all the UEs present in the network
    NtWk.pathlossgain = NtWk.pathgain(NtWk.list_mainUE, :);
    sz = [NtWk.nMainUE, Env.nBS(i_sim, 1)];
  
    ant_gain = beamforming(Env, sz, NtWk.servingBS_des);
 
    %Nakagami fading
    %NtWk.fading = exprnd(1, sz); %Rayleigh fadin
    fading = nakaFad(Env, pathloss_Exp);  %Nakagami-m fading
    NtWk.fading = fading(NtWk.list_mainUE, :);
    
    %Rayleigh fading
    %NtWk.fading = exprnd(1, sz);
    %transmitted_Power = 10^(Env.p/10);
    %transmitted_Power = 10^((Env.p-30)/10);
    %NtWk.received_Power = transmitted_Power.*NtWk.fading.*ant_gain.*NtWk.pathlossgain;
    NtWk.received_Power = NtWk.fading.*ant_gain.*NtWk.pathlossgain;
    %NtWk.received_Power = transmitted_Power.*NtWk.fading.*NtWk.pathloss;
    %NtWk.interferer = transmitted_Power.*fading(NtWk.list_mainUE, :).*ant_gain(NtWk.list_mainUE, :).*Env.K.*pathloss(NtWk.list_mainUE, :);
end    