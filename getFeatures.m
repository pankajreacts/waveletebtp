function [features] = getFeatures(y)
    features = zeros(1, 6); 
    features(1) = std(y);
    features(2) = rms(y); 
    features(3) = peak2rms(y); % crest factor
    features(4) = kurtosis(y); 
    features(5) = skewness(y); 
  %  features(7) = var(y);
    features(6) = range(y);
end