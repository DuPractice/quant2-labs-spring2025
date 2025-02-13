library(tidyverse)

set.seed(1)

N <- 10000
tb <- tibble(
    # Gender is exogenous
    female = sample(c(0, 1), N, replace = T),
    # U is exogenous
    u = rnorm(N),
    # Fill in the rest
    # occ = ...
    # wage = ...
)

# Regress wage on female with and without occupation control. 
# What do we observe?