function y = log_norm_mix_density(x,means,sds,weights)
p = length(means);
terms = zeros(1,p);
for i = 1:p
    terms(i) = log(weights(i))-1/2*(log(2*pi)+log(sds(i)^2)+ ...
        (x-means(i))^2/sds(i)^2); 
end

% Prevent underflow
min_terms = min(terms);
y = min_terms+log(sum(exp(terms-min_terms)));
end
