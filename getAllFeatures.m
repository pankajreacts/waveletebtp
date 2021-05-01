function [feature] = getAllFeatures(x, N)
    [C, L] = wavedec(x, N, 'db4');
    feature = [];
    start = 0;
    for i = 1 : length(L)-1
        x = C(start +1 : start + L(i));
        feature = [feature getFeatures(x)];
        start = start + L(i);
        % figure;
        % plot(x);
    end
end