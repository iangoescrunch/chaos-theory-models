# CHAOS THEORY MODELS - COMPLETE EXTRACTION
## From Gleick's "Chaos: Making a New Science" (1987)

**Extracted for:** Ian's Computational Modeling Project  
**Date:** January 19, 2026  
**Purpose:** Replicate and extend beyond DOSBox implementations for class presentation

---

## TABLE OF CONTENTS

1. [Overview](#overview)
2. [Mathematical Models Extracted](#models)
3. [R Scripts Provided](#scripts)
4. [How to Run](#run)
5. [Extending to Python & Interactive HTML](#extend)
6. [Cognitive Science Applications](#cogsci)
7. [Next Steps](#next)
8. [References](#refs)

---

## 1. OVERVIEW {#overview}

This extraction identifies ALL major mathematical models from Gleick's classic book on chaos theory. Your instructor wants you to replicate what's in the book using DOSBox, but you're going way beyond that with:

1. **Modern R implementations** with publication-quality visualizations
2. **Interactive HTML outputs** anyone can view
3. **Python integration** for advanced rendering
4. **Connections to cognitive science** and your thesis work

### What Makes This "Chaos"?

Three key properties define chaotic systems:

1. **Sensitive Dependence on Initial Conditions** - The Butterfly Effect
2. **Deterministic** - No randomness, follows exact equations
3. **Aperiodic** - Never repeats exactly

---

## 2. MATHEMATICAL MODELS EXTRACTED {#models}

### MODEL 1: The Lorenz System (Chapter 1: "The Butterfly Effect")

**Discovered by:** Edward Lorenz (1963)  
**Original purpose:** Simplified weather model  
**What it revealed:** Deterministic chaos

**The Equations** (as written in book, p. ~30):
```
dx/dt = 10(y-x)
dy/dt = –xz + 28x – y
dz/dt = xy–(8/3)z
```

**Standard notation:**
```
dx/dt = σ(y-x)           where σ = 10 (Prandtl number)
dy/dt = x(ρ-z) - y       where ρ = 28 (Rayleigh number)
dz/dt = xy - βz          where β = 8/3 (geometric factor)
```

**What it models:**
- Atmospheric convection
- Thermal fluid dynamics
- ANY system with feedback and nonlinearity

**Key insight:** Tiny change (0.001) in starting position → completely different trajectory after short time

---

### MODEL 2: The Logistic Map (Chapter 3: "Life's Ups and Downs")

**Discovered by:** Robert May (1976)  
**Original purpose:** Population dynamics  
**What it revealed:** Simple equations can produce chaos

**The Equation:**
```
x_next = r·x·(1-x)
```

where:
- `x` = population at generation n (fraction between 0 and 1)
- `r` = growth rate parameter

**Behavior by r value:**
```
r < 1.0          → Extinction
1.0 < r < 3.0    → Stable equilibrium
3.0 < r < 3.57   → Period-doubling (2, 4, 8, 16... year cycles)
r ≈ 3.57+        → CHAOS (with windows of order)
```

**Book quote (p. ~75):**
> "The logistic equation, x_next = rx(1-x), May increased the parameter as slowly as he could..."

---

### MODEL 3: Feigenbaum's Universal Constants (Chapter 6: "Universality")

**Discovered by:** Mitchell Feigenbaum (1975)  
**Where:** Los Alamos National Laboratory  
**What:** Universal numbers that appear in ALL period-doubling systems

**The Constants:**

**δ (delta) = 4.6692016090...**
- Rate of period-doubling convergence
- Each bifurcation happens δ times faster than the previous
- Book quote (p. ~177): "he got a result to three decimal places: 4.669"

**α (alpha) = 2.502907875...**
- Scaling in parameter space
- Describes self-similar structure

**Revolutionary discovery:** These same numbers appear whether you're studying:
- Population dynamics
- Fluid turbulence
- Electronic circuits
- Heart rhythms
- ANY system with period-doubling!

**Book quote (p. ~177-178):**
> "It was the same number. Incredibly, this trigonometric function was not just displaying a consistent, geometric regularity. It was displaying a regularity that was numerically identical to that of a much simpler function."

---

### MODEL 4: Strange Attractors (Chapter 5: "Strange Attractors")

**Properties:**
1. Attracts nearby trajectories (like a magnet)
2. Trajectories on attractor never repeat
3. Infinitely complex structure (fractal)
4. Sensitive to initial conditions

**Examples in book:**
- Lorenz attractor (butterfly shape)
- Rössler attractor
- Hénon attractor

**Book description (p. ~153):**
> "Loops in phase space... 'Fireworks or galaxies.'"

---

### MODEL 5: Mandelbrot Set & Fractals (Chapter 8: "Images of Chaos")

**The Mandelbrot Set equation:**
```
z_next = z² + c
```

**Properties:**
- Infinitely detailed at all scales
- Boundary between order and chaos
- Self-similar structure

**Fractal Dimension:**
- Not integer dimensions (1D, 2D, 3D)
- Can be 1.26, 2.31, etc.
- Measures "roughness" or complexity

**Book quotes (p. ~114):**
> "A geometry of nature... From clouds to blood vessels... The trash cans of science."

---

## 3. R SCRIPTS PROVIDED {#scripts}

### Script 1: `01_lorenz_attractor.R`
**What it does:**
- Solves Lorenz equations using numerical integration
- Creates 2D projections (the classic butterfly wings)
- Demonstrates butterfly effect with two trajectories
- Generates time series showing chaotic oscillations

**Outputs:**
- `lorenz_xz_projection.pdf` - Classic butterfly shape
- `lorenz_timeseries.pdf` - Chaotic time evolution
- `butterfly_effect.pdf` - Divergence visualization

---

### Script 2: `02_logistic_map_bifurcation.R`
**What it does:**
- Implements logistic map for different r values
- Computes complete bifurcation diagram
- Shows period-doubling route to chaos
- Creates cobweb diagrams
- Demonstrates Feigenbaum constants

**Outputs:**
- `logistic_map_examples.pdf` - Behavior at different r values
- `feigenbaum_bifurcation.pdf` - Full bifurcation diagram
- `bifurcation_zoom1.pdf` - Zoom showing self-similarity
- `bifurcation_zoom2.pdf` - Even closer zoom
- `cobweb_r*.pdf` - Iteration diagrams

---

### Script 3: `chaos_models_extraction.Rmd`
**What it is:**
- R Markdown document with everything
- Can be rendered to HTML with interactive plots
- Includes mathematical derivations
- Has cognitive science connections

**To render:**
```r
rmarkdown::render('chaos_models_extraction.Rmd')
```

---

## 4. HOW TO RUN {#run}

### Option A: In RStudio (Recommended for you)

1. Open RStudio
2. Open one of the `.R` files
3. Click "Source" button (or Ctrl+Shift+S)
4. PDFs will be generated in your working directory

### Option B: Command Line

```bash
# Make scripts executable
chmod +x *.R

# Run them
Rscript 01_lorenz_attractor.R
Rscript 02_logistic_map_bifurcation.R
```

### Option C: Interactive in R Console

```r
# Load the script
source("01_lorenz_attractor.R")

# Or run line by line for exploration
```

---

## 5. EXTENDING TO PYTHON & INTERACTIVE HTML {#extend}

### Python Version (for your RTX 4090!)

**Why Python:**
- Faster for large-scale simulations
- Better 3D rendering (Plotly, Mayavi)
- TensorFlow integration for neural network analogies
- Can create standalone web apps

**Example structure:**
```python
import numpy as np
from scipy.integrate import odeint
import plotly.graph_objects as go

def lorenz(state, t, sigma=10, rho=28, beta=8/3):
    x, y, z = state
    return [sigma*(y-x), x*(rho-z)-y, x*y-beta*z]

# Solve and visualize...
```

### Interactive HTML with R

**Using Plotly in R:**
```r
library(plotly)

fig <- plot_ly(data, x=~x, y=~y, z=~z, type='scatter3d')
htmlwidgets::saveWidget(fig, "interactive.html")
```

**Using Shiny for Dashboard:**
```r
library(shiny)

ui <- fluidPage(
  sliderInput("r", "Growth Rate", min=2.5, max=4, value=3.5),
  plotOutput("bifurcation")
)

server <- function(input, output) {
  output$bifurcation <- renderPlot({
    # Generate plot based on input$r
  })
}

shinyApp(ui, server)
```

---

## 6. COGNITIVE SCIENCE APPLICATIONS {#cogsci}

### How Chaos Theory Connects to Your Work

#### 1. **Automaticity as Attractors**
- Repeated behaviors create stable attractors
- Breaking habits = escaping attractor basin
- Your thesis: Goal pursuit automatization → attractor dynamics

#### 2. **Implicit Theories as Bifurcation Parameters**
- Fixed mindset vs. growth mindset = different r values
- Small shifts in beliefs → dramatic behavioral changes (bifurcations)
- Motivation systems near critical points most sensitive to intervention

#### 3. **Neural Dynamics**
- Brain activity exhibits chaotic patterns
- EEG/fMRI data analysis using chaos measures
- Attractor networks in memory and perception

#### 4. **Reinforcement Learning in Chaotic Environments**
- How do agents learn optimal policies in chaotic state spaces?
- Bayesian updating with sensitive dependence
- Exploration-exploitation in bifurcation regions

#### 5. **Decision Making Under Uncertainty**
- Butterfly effect in choice outcomes
- Initial conditions = momentary emotional states
- Small mood fluctuations → large behavioral differences

### Potential Research Questions

1. **Can we model goal pursuit as a dynamical system?**
   - What are the "equations of motion" for motivated behavior?
   - Do different motivational states correspond to different attractors?

2. **Are there Feigenbaum-like universals in behavioral change?**
   - Do habit formation trajectories show universal scaling?
   - Is there a "universality class" for automaticity development?

3. **How do implicit theories affect the stability of behavioral attractors?**
   - Fixed mindset = deeper attractor basins?
   - Growth mindset = more flexible dynamics?

4. **What role does chaos play in creativity?**
   - Edge of chaos = optimal for innovation?
   - Too much order = rigidity, too much chaos = randomness

---

## 7. NEXT STEPS {#next}

### For Your Class Presentation

**Phase 1: Replicate the Book (Exceed DOSBox requirement)**
- [x] Extract all mathematical models
- [x] Implement in modern R
- [ ] Create presentation-ready visualizations
- [ ] Add annotations explaining each model

**Phase 2: Add Interactivity**
- [ ] Convert to R Shiny dashboard
  - Sliders to adjust parameters
  - Real-time visualization updates
  - Side-by-side comparisons
- [ ] Export to standalone HTML
- [ ] Host on personal website (GitHub Pages)

**Phase 3: Python Integration**
- [ ] Reimplement in Python with Plotly
- [ ] Create 3D animated videos (using your RTX 4090!)
- [ ] Compare R vs Python performance
- [ ] Use TensorFlow to create "neural chaos"

**Phase 4: Original Research Connection**
- [ ] Apply to your RCSA grant data
- [ ] Model automaticity development as dynamical system
- [ ] Test for chaos in behavioral time series
- [ ] Include in thesis/publications

### Additional Models to Implement

From Gleick's book that we haven't coded yet:

1. **Hénon Map** (2D discrete system)
2. **Rössler Attractor** (simpler than Lorenz)
3. **Mandelbrot Set** (complex plane iterations)
4. **Julia Sets** (related to Mandelbrot)
5. **Dripping Faucet** (Chapter 9: real-world chaos)
6. **Heart Arrhythmia Models** (Chapter 10: chaos in biology)

### GitHub Repository Structure

```
chaos-theory-models/
├── README.md
├── data/
│   └── gleick_book_models.csv
├── R/
│   ├── 01_lorenz_attractor.R
│   ├── 02_logistic_map_bifurcation.R
│   ├── 03_mandelbrot_set.R
│   └── utils.R
├── python/
│   ├── lorenz.py
│   ├── logistic.py
│   └── visualization.py
├── outputs/
│   ├── figures/
│   └── html/
├── docs/
│   └── chaos_models_extraction.html
└── presentations/
    └── class_presentation.Rmd
```

---

## 8. REFERENCES {#refs}

### Primary Source
**Gleick, J. (1987).** *Chaos: Making a New Science.* Viking Penguin.

### Original Research Papers

**Lorenz, E. N. (1963).** Deterministic nonperiodic flow. *Journal of the Atmospheric Sciences*, 20(2), 130-141.

**May, R. M. (1976).** Simple mathematical models with very complicated dynamics. *Nature*, 261(5560), 459-467.

**Feigenbaum, M. J. (1978).** Quantitative universality for a class of nonlinear transformations. *Journal of Statistical Physics*, 19(1), 25-52.

**Mandelbrot, B. B. (1982).** *The Fractal Geometry of Nature.* W.H. Freeman.

### Modern Applications to Cognitive Science

**Vallacher, R. R., & Nowak, A. (Eds.). (1994).** *Dynamical Systems in Social Psychology.* Academic Press.

**Thelen, E., & Smith, L. B. (1994).** *A Dynamic Systems Approach to the Development of Cognition and Action.* MIT Press.

**Freeman, W. J. (2000).** Neurodynamics: An exploration in mesoscopic brain dynamics. Springer.

### Technical Resources

**Strogatz, S. H. (2015).** *Nonlinear Dynamics and Chaos* (2nd ed.). Westview Press.
- The modern textbook on chaos theory
- Has exercises and computational examples

**Kaplan, D., & Glass, L. (1995).** *Understanding Nonlinear Dynamics.* Springer.
- Applied approach with real data
- Good for psychology/biology applications

### R Packages for Chaos Analysis

- **deSolve**: Differential equation solvers
- **tseriesChaos**: Time series analysis for chaotic systems
- **nonlinearTseries**: Nonlinear time series tools
- **fractaldim**: Fractal dimension estimation
- **pracma**: Practical numerical analysis

### Python Packages

- **scipy**: ODE solvers, numerical tools
- **matplotlib**: 2D plotting
- **plotly**: Interactive 3D visualization
- **networkx**: Complex network analysis
- **pyts**: Time series analysis

---

## APPENDIX: Mathematical Formulas

### Lorenz System (Full Derivation)

Starting from Navier-Stokes equations for fluid flow, Lorenz made several simplifying assumptions to arrive at a 3-variable system representing:
- x: Intensity of convective motion
- y: Temperature difference (horizontal)
- z: Temperature difference (vertical)

The parameters:
- σ (sigma): Prandtl number (ratio of momentum to thermal diffusivity)
- ρ (rho): Rayleigh number (driving temperature difference)
- β (beta): Geometric factor (aspect ratio of convection rolls)

### Lyapunov Exponents

Measure of divergence rate:
```
λ = lim[t→∞] (1/t) ln(|δx(t)|/|δx(0)|)
```

- λ > 0: Chaotic (exponential divergence)
- λ = 0: Periodic
- λ < 0: Stable fixed point

For Lorenz system at classic parameters:
- λ₁ ≈ 0.906 (positive! → chaos)
- λ₂ ≈ 0
- λ₃ ≈ -14.572

### Correlation Dimension

Measure of fractal dimension:
```
D₂ = lim[ε→0] ln(C(ε))/ln(ε)
```

For Lorenz attractor: D₂ ≈ 2.06
(Not an integer! → fractal structure)

---

## CONTACT & COLLABORATION

For your PhD applications, this project demonstrates:
1. **Strong quantitative skills** - Complex differential equations
2. **Programming proficiency** - R, Python, TensorFlow
3. **Theoretical sophistication** - Dynamical systems, chaos theory
4. **Applied relevance** - Connections to cognitive science
5. **Communication** - Visualizations, presentations

Consider reaching out to faculty at your target programs who work on:
- Computational cognitive science
- Dynamical systems approaches to cognition
- Neural dynamics
- Behavioral modeling

**Your project shows exactly the kind of interdisciplinary, quantitative approach that competitive social-personality programs are looking for!**

---

**Document Created:** January 19, 2026  
**For:** Ian's Computational Modeling & Chaos Theory Project  
**Status:** Ready for implementation and class presentation
