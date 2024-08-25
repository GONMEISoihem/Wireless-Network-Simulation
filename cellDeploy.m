function [NtWk] = cellDeploy(i_sim, Env)
    %% BS Generation
    NtWk.posR = zeros(Env.nBS(i_sim, 1), 1);
    NtWk.posR(1:Env.nMainBS(i_sim, 1), 1) = Env.measure_Radius*sqrt(rand(Env.nMainBS(i_sim, 1), 1));
    NtWk.posR(Env.nMainBS(i_sim, 1) + 1:Env.nBS(i_sim,1), 1) = sqrt(Env.measure_Radius^2+rand(Env.nDummyBS(i_sim, 1), 1) * (Env.dummy_Radius^2 - Env.measure_Radius^2));
    
    NtWk.posTh = 2*pi*rand(Env.nBS(i_sim, 1), 1);
    
    % into Cartesian
    NtWk.posX = NtWk.posR.*cos(NtWk.posTh);
    NtWk.posY = NtWk.posR.*sin(NtWk.posTh);
    NtWk.posBS = NtWk.posX + NtWk.posY * 1i;
    
    %figure(1), scatter(NtWk.posX, NtWk.posY, '^');
    %hold on;
    %voronoi(NtWk.posX, NtWk.posY);
    %hold on;
    %% UE Generation
    R = Env.dummy_Radius*sqrt(rand(Env.nUE(i_sim, 1), 1));
    Th = 2*pi*rand(Env.nUE(i_sim, 1), 1);
    
    X = R.*cos(Th);
    Y = R.*sin(Th);
    NtWk.posUE = X + 1i*Y;
    %scatter(X, Y, '.', 'k');
    %hold off;
end
