make_clustered_data <- function(G, N) {
    g <- sample(1:G, size = N, replace = T)
    treat.g <- sample(c(0, 1), size = G, replace = T)
    while (is.na(sd(treat.g))) {
        treat.g <- sample(c(0, 1), size = G, replace = T)
    }
    treat.i <- sapply(g, \(x) treat.g[x])
    effect.g <- rnorm(1:G)
    g.i <- sapply(g, \(x) effect.g[x])
    y <- rnorm(N) + g.i + 0.5 * treat.i
    data.frame(
        g = g,
        treat = treat.i,
        y = y
    )
}

df <- make_clustered_data(10, 100)
model <- lm(y ~ treat)
df$y_pred <- predict(model, df)
df$residuals <- df$y - df$y_pred

# Implement wild bootstrap
# ...