function [ant_gain] = beamforming(Env, sz, serBSidx)
    
    ant_gain_BS = zeros(sz);
    ant_gain_UE = zeros(sz);

    prob_BS = rand(sz);
    prob_UE = rand(sz);
    

    for i = 1: sz(1)
        prob_BS(i, serBSidx(i, 1)) = 0;
        prob_UE(i, serBSidx(i, 1)) = 0;
    end    

    ant_gain_BS(prob_BS > Env.theta_b/(2)) = 10^(Env.gb/10);
    ant_gain_BS(prob_BS <= Env.theta_b/(2)) = 10^(Env.Gb/10);

    
    ant_gain_UE(prob_UE > Env.theta_u/(2)) = 10^(Env.gu/10);
    ant_gain_UE(prob_UE <= Env.theta_u/(2)) = 10^(Env.Gu/10);

    ant_gain = ant_gain_BS.*ant_gain_UE;
    

end