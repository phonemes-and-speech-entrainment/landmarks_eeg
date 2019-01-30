load('pca_vars.mat');

[coeff_itc,score_itc,latent_itc,tsquared_itc,explained_itc,mu_itc] = pca(itc_pca);
[coeff_pow,score_pow,latent_pow,tsquared_pow,explained_pow,mu_pow] = pca(pow_pca);