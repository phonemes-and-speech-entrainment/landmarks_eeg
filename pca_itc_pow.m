%{
This script computes the PCA of ITC and Evoked Power at 4, 8, 12 and 16 Hz, 
averaged over channels and conditions. N=16 is number of subjects.

(c) Oana Cucu, October 2019. oana.cucu@bristol.ac.uk
%}


load('pca_vars.mat');

[coeff_itc,score_itc,latent_itc,tsquared_itc,explained_itc,mu_itc] = pca(itc_pca);
[coeff_pow,score_pow,latent_pow,tsquared_pow,explained_pow,mu_pow] = pca(pow_pca);