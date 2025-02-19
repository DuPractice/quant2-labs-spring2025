# Simulate data
set.seed(3141)
n_obs <- 100
n_vars <- 100
theta <- 2
X <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
d_effects <- sample(c(1, 0, 1), 100, replace = T) * runif(n_vars, 0, 9)
d <- X[, 1:100] %*% d_effects + rnorm(n_obs)

x_effects <- sample(c(1, 0, 1), 100, replace = T) * runif(n_vars, 0, 9)
y <- theta * d + X[, 1:100] %*% x_effects + rnorm(n_obs)

dml_data_sim <- double_ml_data_from_matrix(X = X, y = y, d = d)
dml_data_sim$data %>% saveRDS(here::here("lab04/data.rds"))
