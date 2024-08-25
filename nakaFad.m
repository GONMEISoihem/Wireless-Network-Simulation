function fading = nakaFad(Env, pathloss)
    sz = size(pathloss);
    fading_LOS = random('gamma', Env.nakagami_M(1), 1/Env.nakagami_M(1), sz);
    fading_NLOS = random('gamma', Env.nakagami_M(2), 1/Env.nakagami_M(2), sz);
    fading = zeros(sz);

    for i = 1:sz(1)
        for k = 1:sz(2)
            if pathloss(i, k) == Env.alpha(1)
                fading(i, k) = fading_LOS(i, k);
            else
                fading(i, k) = fading_NLOS(i, k);
            end
        end
    end
end
