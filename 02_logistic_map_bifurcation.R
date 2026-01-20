#!/usr/bin/env Rscript
# ============================================================================
# Logistic Map & Feigenbaum's Bifurcation Diagram
# Based on Gleick's "Chaos: Making a New Science" - Chapter 3
# ============================================================================

cat("==============================================================\n")
cat("  LOGISTIC MAP & FEIGENBAUM'S BIFURCATIONS\n")
cat("  From Gleick's 'Chaos: Making a New Science'\n")
cat("==============================================================\n\n")

# ============================================================================
# THE LOGISTIC EQUATION (from Gleick, Chapter 3: "Life's Ups and Downs")
# ============================================================================
# x_next = r*x*(1-x)
# 
# Where:
#   x = population (as fraction between 0 and 1)
#   r = growth rate parameter
#
# Behavior:
#   r < 1:     Population dies out
#   1 < r < 3: Population stabilizes
#   3 < r < 3.57: Period-doubling (2, 4, 8, 16... year cycles)
#   r > 3.57:  CHAOS
# ============================================================================

logistic_map <- function(r, x0, n_iterations = 100) {
  x <- numeric(n_iterations)
  x[1] <- x0
  
  for (i in 2:n_iterations) {
    x[i] <- r * x[i-1] * (1 - x[i-1])
  }
  
  return(x)
}

# ============================================================================
# Example Trajectories at Different Growth Rates
# ============================================================================

cat("Generating example trajectories...\n")

pdf("logistic_map_examples.pdf", width = 12, height = 8)
par(mfrow = c(2, 2))

# r = 2.7: Stable fixed point
x <- logistic_map(2.7, 0.5, 100)
plot(1:100, x, type = "l", col = "blue", lwd = 2,
     main = "r = 2.7: Stable Equilibrium",
     xlab = "Generation", ylab = "Population (x)",
     ylim = c(0, 1))
abline(h = tail(x, 1), col = "red", lty = 2)

# r = 3.2: Period-2 cycle
x <- logistic_map(3.2, 0.5, 100)
plot(1:100, x, type = "l", col = "darkgreen", lwd = 2,
     main = "r = 3.2: Period-2 Oscillation",
     xlab = "Generation", ylab = "Population (x)",
     ylim = c(0, 1))

# r = 3.5: Period-4 cycle
x <- logistic_map(3.5, 0.5, 100)
plot(1:100, x, type = "l", col = "purple", lwd = 2,
     main = "r = 3.5: Period-4 Oscillation",
     xlab = "Generation", ylab = "Population (x)",
     ylim = c(0, 1))

# r = 3.9: CHAOS
x <- logistic_map(3.9, 0.5, 100)
plot(1:100, x, type = "l", col = "red", lwd = 2,
     main = "r = 3.9: CHAOS",
     xlab = "Generation", ylab = "Population (x)",
     ylim = c(0, 1))

dev.off()

cat("✓ Saved: logistic_map_examples.pdf\n\n")

# ============================================================================
# FEIGENBAUM'S BIFURCATION DIAGRAM
# ============================================================================
# Mitchell Feigenbaum discovered universal constants in the period-doubling
# route to chaos. This diagram visualizes the transition from order to chaos.
#
# FEIGENBAUM'S CONSTANT: δ ≈ 4.6692016090...
# This constant describes how fast the bifurcations occur!
# ============================================================================

cat("Computing bifurcation diagram (this takes a moment)...\n")

# Function to compute attractor values for a given r
compute_attractor <- function(r, x0 = 0.5, n_iterations = 500, n_last = 200) {
  x <- logistic_map(r, x0, n_iterations)
  # Return only the last n_last values (after transients settle)
  return(x[(n_iterations - n_last + 1):n_iterations])
}

# Generate r values
r_values <- seq(2.5, 4.0, by = 0.001)

# Compute bifurcation data
bifurcation_data <- data.frame()
for (i in seq_along(r_values)) {
  if (i %% 100 == 0) cat(paste0("Progress: ", round(100*i/length(r_values)), "%\r"))
  r <- r_values[i]
  x_vals <- compute_attractor(r)
  bifurcation_data <- rbind(bifurcation_data, 
                            data.frame(r = r, x = x_vals))
}

cat("\n✓ Bifurcation data computed!\n\n")

# Create the bifurcation diagram
cat("Creating bifurcation diagram...\n")

pdf("feigenbaum_bifurcation.pdf", width = 14, height = 9)
plot(bifurcation_data$r, bifurcation_data$x, pch = ".", 
     cex = 0.3, col = "darkblue",
     main = "Feigenbaum's Bifurcation Diagram\nThe Period-Doubling Route to Chaos",
     xlab = "Growth Rate (r)", 
     ylab = "Population (x)",
     xlim = c(2.5, 4.0), ylim = c(0, 1))

# Add annotations
text(2.7, 0.95, "Stable", col = "red", cex = 1.2, font = 2)
text(3.15, 0.95, "Period 2", col = "red", cex = 1.2, font = 2)
text(3.5, 0.95, "Period 4,8,16...", col = "red", cex = 1.2, font = 2)
text(3.8, 0.95, "CHAOS", col = "red", cex = 1.5, font = 2)

# Mark first bifurcation
abline(v = 3.0, col = "gray", lty = 2, lwd = 1)
text(3.0, 0.05, "First\nbifurcation", col = "gray", cex = 0.9)

dev.off()

cat("✓ Saved: feigenbaum_bifurcation.pdf\n\n")

# ============================================================================
# FEIGENBAUM CONSTANTS
# ============================================================================

cat("==============================================================\n")
cat("  FEIGENBAUM'S UNIVERSAL CONSTANTS\n")
cat("==============================================================\n\n")

cat("δ (delta) ≈ 4.6692016090...\n")
cat("  Rate at which bifurcations occur\n")
cat("  Each bifurcation happens δ times faster than previous\n\n")

cat("α (alpha) ≈ 2.502907875...\n")
cat("  Scaling of parameter space\n\n")

cat("These constants are UNIVERSAL - they appear in ALL systems\n")
cat("that undergo period-doubling bifurcations!\n\n")

# ============================================================================
# ZOOM INTO BIFURCATION DIAGRAM - Show self-similarity
# ============================================================================

cat("Creating zoom views to show self-similarity...\n")

# Zoom 1: Region around r=3.5
r_zoom1 <- seq(3.4, 3.6, by = 0.0005)
zoom1_data <- data.frame()
for (r in r_zoom1) {
  x_vals <- compute_attractor(r)
  zoom1_data <- rbind(zoom1_data, data.frame(r = r, x = x_vals))
}

pdf("bifurcation_zoom1.pdf", width = 10, height = 7)
plot(zoom1_data$r, zoom1_data$x, pch = ".", cex = 0.4, col = "darkblue",
     main = "Bifurcation Diagram - Zoom 1 (r = 3.4 to 3.6)",
     xlab = "Growth Rate (r)", ylab = "Population (x)")
dev.off()

# Zoom 2: Even closer
r_zoom2 <- seq(3.54, 3.58, by = 0.0002)
zoom2_data <- data.frame()
for (r in r_zoom2) {
  x_vals <- compute_attractor(r)
  zoom2_data <- rbind(zoom2_data, data.frame(r = r, x = x_vals))
}

pdf("bifurcation_zoom2.pdf", width = 10, height = 7)
plot(zoom2_data$r, zoom2_data$x, pch = ".", cex = 0.4, col = "darkblue",
     main = "Bifurcation Diagram - Zoom 2 (r = 3.54 to 3.58)\nNotice the self-similar structure!",
     xlab = "Growth Rate (r)", ylab = "Population (x)")
dev.off()

cat("✓ Saved: bifurcation_zoom1.pdf\n")
cat("✓ Saved: bifurcation_zoom2.pdf\n\n")

# ============================================================================
# COBWEB DIAGRAMS - Visual iteration process
# ============================================================================

cat("Creating cobweb diagrams...\n")

cobweb <- function(r, x0, n_iterations = 50) {
  pdf(paste0("cobweb_r", r, ".pdf"), width = 8, height = 8)
  
  # Setup plot
  x_range <- seq(0, 1, by = 0.01)
  y_range <- r * x_range * (1 - x_range)
  
  plot(x_range, y_range, type = "l", col = "blue", lwd = 2,
       main = paste0("Cobweb Diagram (r = ", r, ")"),
       xlab = "x(n)", ylab = "x(n+1)",
       xlim = c(0, 1), ylim = c(0, 1))
  abline(0, 1, col = "gray", lty = 2)  # Identity line
  
  # Draw cobweb
  x <- x0
  for (i in 1:n_iterations) {
    x_next <- r * x * (1 - x)
    segments(x, x, x, x_next, col = "red", lwd = 1)
    segments(x, x_next, x_next, x_next, col = "red", lwd = 1)
    x <- x_next
  }
  
  # Mark starting point
  points(x0, x0, pch = 19, col = "green", cex = 2)
  
  dev.off()
}

cobweb(2.8, 0.1, 30)
cobweb(3.2, 0.1, 30)
cobweb(3.9, 0.1, 50)

cat("✓ Saved cobweb diagrams\n\n")

# ============================================================================
# SUMMARY
# ============================================================================

cat("==============================================================\n")
cat("  ALL VISUALIZATIONS CREATED!\n")
cat("==============================================================\n\n")

cat("Key Files:\n")
cat("  1. logistic_map_examples.pdf - Behavior at different r values\n")
cat("  2. feigenbaum_bifurcation.pdf - Full bifurcation diagram\n")
cat("  3. bifurcation_zoom1.pdf - Zoomed view showing structure\n")
cat("  4. bifurcation_zoom2.pdf - Even closer zoom\n")
cat("  5. cobweb_r*.pdf - Iteration diagrams\n\n")

cat("Key Insights:\n")
cat("  - Simple equation → incredibly complex behavior\n")
cat("  - Period-doubling route to chaos\n")
cat("  - Universal Feigenbaum constants\n")
cat("  - Self-similar (fractal) structure\n")
cat("  - Relevant to population biology, economics, neuroscience!\n\n")

cat("For your cognitive science work:\n")
cat("  - Models habit formation (stable attractors)\n")
cat("  - Explains sudden behavioral shifts (bifurcations)\n")
cat("  - Describes decision-making dynamics\n")
cat("  - Connects to neural oscillations\n\n")
