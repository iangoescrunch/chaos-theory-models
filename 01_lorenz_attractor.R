#!/usr/bin/env Rscript
# ============================================================================
# Lorenz Attractor - The Butterfly Effect
# Based on Gleick's "Chaos: Making a New Science"
# ============================================================================

cat("==============================================================\n")
cat("  LORENZ ATTRACTOR - THE BUTTERFLY EFFECT\n")
cat("  From Gleick's 'Chaos: Making a New Science'\n")
cat("==============================================================\n\n")

# Install and load required packages
packages <- c("deSolve", "ggplot2")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(paste("Installing", pkg, "...\n"))
    install.packages(pkg, repos = "http://cran.r-project.org", quiet = TRUE)
    library(pkg, character.only = TRUE)
  }
}

# ============================================================================
# THE LORENZ EQUATIONS (from Gleick, p. ~30)
# ============================================================================
# dx/dt = 10(y-x)           [σ(y-x) where σ=10]
# dy/dt = –xz + 28x – y     [x(ρ-z) - y where ρ=28]
# dz/dt = xy–(8/3)z         [xy - βz where β=8/3]
# ============================================================================

lorenz_system <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dx <- sigma * (y - x)
    dy <- x * (rho - z) - y
    dz <- x * y - beta * z
    list(c(dx, dy, dz))
  })
}

# Classic parameters
parameters <- c(sigma = 10, rho = 28, beta = 8/3)
initial_state <- c(x = 1, y = 1, z = 1)
times <- seq(0, 50, by = 0.01)

cat("Solving Lorenz equations...\n")
solution <- ode(y = initial_state, times = times, 
                func = lorenz_system, parms = parameters)
lorenz_df <- as.data.frame(solution)

cat("Creating visualizations...\n\n")

# X-Z Projection (Classic Butterfly Wings)
pdf("lorenz_xz_projection.pdf", width = 10, height = 8)
plot(lorenz_df$x, lorenz_df$z, type = "l", col = "steelblue",
     main = "Lorenz Attractor - X-Z Projection\n(The Classic 'Butterfly Wings')",
     xlab = "X", ylab = "Z", lwd = 0.5)
dev.off()

# Time series
pdf("lorenz_timeseries.pdf", width = 10, height = 6)
plot(lorenz_df$time[1:2000], lorenz_df$x[1:2000], type = "l", col = "blue",
     main = "Chaotic Dynamics - X coordinate over time",
     xlab = "Time", ylab = "X", lwd = 1)
dev.off()

# BUTTERFLY EFFECT
cat("Demonstrating Butterfly Effect...\n")
initial_state2 <- c(x = 1.001, y = 1, z = 1)
solution2 <- ode(y = initial_state2, times = times, 
                 func = lorenz_system, parms = parameters)
df2 <- as.data.frame(solution2)

pdf("butterfly_effect.pdf", width = 10, height = 6)
plot(lorenz_df$time, lorenz_df$x, type = "l", col = "blue", lwd = 1.5,
     main = "Butterfly Effect: Sensitivity to Initial Conditions",
     sub = "Two trajectories starting 0.001 apart",
     xlab = "Time", ylab = "X coordinate", ylim = range(c(lorenz_df$x, df2$x)))
lines(df2$time, df2$x, col = "red", lwd = 1.5)
legend("topright", legend = c("Initial: x=1.000", "Initial: x=1.001"),
       col = c("blue", "red"), lwd = 2)
dev.off()

cat("\n✓ Visualizations saved:\n")
cat("  - lorenz_xz_projection.pdf\n")
cat("  - lorenz_timeseries.pdf\n")
cat("  - butterfly_effect.pdf\n\n")
cat("Key insights:\n")
cat("- Butterfly-like structure in phase space\n")
cat("- Aperiodic (never repeats)\n")
cat("- Sensitive to initial conditions\n")
cat("- Deterministic chaos!\n\n")
