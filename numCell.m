function [Env] = numCell(Env)
    %Env.measure_Radius = sqrt(Env.average_BS/pi/Env.density_UE);
    Env.measure_Radius = 447.2136 ;
    Env.dummy_Radius = Env.measure_Radius*2;
    sz = [Env.nSim, 1];
    %disp(Env.measure_Radius);
    %disp(Env.dummy_Radius);
    %% BS number generation using poissrnd

    lambda = Env.density_BS*pi*Env.measure_Radius^2;
    Env.nMainBS = poissrnd(lambda, sz);
    %Env.nMainBS = zeros(sz);
    %Env.nMainBS = Env.nMainBS+47122;
    for i = 1:Env.nSim
        if Env.nMainBS(i, 1) == 0
            Env.nMainBS(i, 1) = 1;
        end
    end
    
    %disp("Main BS");
    %disp(Env.nMainBS);
    lambda_d = Env.density_BS*pi*(Env.dummy_Radius^2 - Env.measure_Radius^2);
    Env.nDummyBS = poissrnd(lambda_d, sz);
    %Env.nDummyBS = zeros(sz);
    %Env.nDummyBS = Env.nDummyBS+188490;
    %disp("dummy BS");
    %disp(Env.nDummyBS);
    
    for i = 1:Env.nSim
        if Env.nDummyBS(i, 1) == 0
           Env.nDummyBS(i, 1) = 1;
        end
    end
    
    Env.nBS = Env.nMainBS + Env.nDummyBS;
    
    %disp(Env.nBS);
    %% UE number
    lambda_UE = Env.density_UE*pi*Env.measure_Radius^2;
    Env.nUE = poissrnd(lambda_UE, sz);
    %disp(Env.nUE);
end    


