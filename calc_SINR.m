function[NtWk] = calc_SINR(i_sim, Env, NtWk)
%% SINR
    if Env.type == 2
        Env.nBS(i_sim, 1) = NtWk.nBS(i_sim, 1);
        Env.nMainBS(i_sim, 1) = NtWk.nMainBS(i_sim, 1);
    end  

    NtWk.SINR = zeros(NtWk.nMainUE, 1);
    NtWk.serveBS = length(unique(NtWk.servingBS_des));
   
    for sinr_i = 1:NtWk.nMainUE
        serving_BS = NtWk.servingBS_des(sinr_i, 1);
        
        NtWk.I = sum(NtWk.received_Power(sinr_i, [1:serving_BS-1 serving_BS+1:Env.nBS(i_sim, 1)]), 2); % + Interferer;
        %NtWk.I = sum(NtWk.received_Power(sinr_i, [1:serving_BS-1 serving_BS+1:Env.nBS]), 2); % + Interferer;
        %%calculate interference
       
        NtWk.SINR(sinr_i, 1) = NtWk.received_Power(sinr_i, serving_BS) / (Env.sigma + NtWk.I);
        %NtWk.SINR(sinr_i, 1) = NtWk.received_Power(sinr_i, serving_BS) / (NtWk.I);
    end
    
    NtWk.SINR_dB = 10.*log10(NtWk.SINR);
    
 
end    

    