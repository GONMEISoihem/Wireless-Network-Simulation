function [pathloss_Exp, abs_coeff] = func_LN(i_sim, Env, NtWk)
    pathloss_Exp = zeros(size(NtWk.distance));
    abs_coeff = zeros(size(NtWk.distance));
    prob_LOS = exp(-1*NtWk.distance/Env.tau);
    prob_LOS_step = binornd(1, prob_LOS);

    for i  = 1:Env.nUE(i_sim, 1)
        for j = 1:Env.nBS(i_sim, 1)
            if prob_LOS_step(i, j) == 0
                pathloss_Exp(i, j) = Env.alpha(2);
                abs_coeff(i, j) = Env.abs(2);
            else
                pathloss_Exp(i, j) = Env.alpha(1);
                abs_coeff(i, j) = Env.abs(1);
            end
        end
    end 
end    