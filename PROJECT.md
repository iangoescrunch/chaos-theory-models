# Chaos Theory Models - Computational Modeling Class Project

**Student:** Ian  
**Course:** Computational Modeling  
**Topic:** Mathematical models from Gleick's "Chaos: Making a New Science"  
**Repository:** https://github.com/iangoescrunch/chaos-theory-models  

---

## 📋 Project Overview

Implementation of chaos theory models extracted from James Gleick's book, going beyond the instructor's DOSBox requirement with modern R visualizations, interactive outputs, and connections to cognitive science research.

### Project Goals

- [x] Extract mathematical models from Gleick's book
- [x] Implement models in R with publication-quality visualizations
- [ ] Present models to class
- [ ] Extend to Python with GPU acceleration (RTX 4090)
- [ ] Connect to RCSA grant data on automaticity
- [ ] Apply to PhD applications in experimental psychology

---

## 🎯 Current Status

### ✅ Completed (Phase 1)

#### Book Analysis
- [x] Extracted text from 370-page PDF of Gleick's "Chaos"
- [x] Identified key mathematical models and equations
- [x] Created comprehensive 29-page study guide with:
  - Chapter-by-chapter summaries with full context
  - Operational definitions (complicated/complex/chaos)
  - Extended glossary with chapter references
  - All questions answered for class discussion

#### Model Implementation
- [x] **Lorenz Attractor** (`01_lorenz_attractor.R`)
  - Three equations: dx/dt = 10(y-x), dy/dt = -xz + 28x - y, dz/dt = xy - (8/3)z
  - Outputs: XZ projection (butterfly wings), time series, butterfly effect demo
  - Demonstrates sensitive dependence on initial conditions

- [x] **Logistic Map** (`02_logistic_map_bifurcation.R`)
  - One equation: x_next = r·x·(1-x)
  - Bifurcation diagram showing period-doubling route to chaos
  - Cobweb plots for different r values
  - Zoom views showing self-similar fractal structure
  - Feigenbaum constant visible: δ ≈ 4.669

#### Documentation
- [x] `START_HERE_PROJECT_SUMMARY.md` - Quick start guide
- [x] `CHAOS_MODELS_COMPLETE_GUIDE.md` - Comprehensive reference with:
  - All mathematical formulas with book page references
  - Cognitive science applications (automaticity, implicit theories, goal pursuit)
  - Research questions for thesis
  - PhD application angles
- [x] `chaos_models_extraction.Rmd` - R Markdown for interactive HTML output
- [x] `Chaos_Study_Guide_EXPANDED.pdf` - Complete book substitute for class

#### Repository Setup
- [x] Created public GitHub repository
- [x] All files uploaded and organized
- [x] Repository description and README

---

## 📂 File Structure

```
chaos-theory-models/
├── README.md                              # Repository overview
├── PROJECT.md                             # This file - project tracking
├── START_HERE_PROJECT_SUMMARY.md          # Quick start guide
├── CHAOS_MODELS_COMPLETE_GUIDE.md         # Complete technical reference
│
├── R_scripts/
│   ├── 01_lorenz_attractor.R              # Lorenz system implementation
│   ├── 02_logistic_map_bifurcation.R      # Logistic map & bifurcations
│   └── chaos_models_extraction.Rmd        # Interactive R Markdown
│
├── outputs/
│   ├── lorenz_xz_projection.pdf           # Butterfly attractor
│   ├── lorenz_timeseries.pdf              # Time series plots
│   ├── butterfly_effect.pdf               # Sensitivity demonstration
│   ├── logistic_map_examples.pdf          # Behavior by r parameter
│   ├── feigenbaum_bifurcation.pdf         # Period-doubling diagram
│   ├── bifurcation_zoom1.pdf              # Fractal self-similarity
│   ├── bifurcation_zoom2.pdf              # Deeper zoom
│   └── cobweb_*.pdf                       # Cobweb diagrams
│
├── documentation/
│   ├── Chaos_Study_Guide_EXPANDED.pdf     # Complete book substitute
│   └── references.bib                     # Citations (Lorenz 1963, May 1976, etc.)
│
└── data/
    └── gleick_chaos_extracted_text.txt    # Source material
```

---

## 🚀 Phase 2: Class Presentation (NEXT UP)

### Immediate Tasks

- [ ] **Run R Scripts**
  - [ ] Test `01_lorenz_attractor.R` - verify plots generate
  - [ ] Test `02_logistic_map_bifurcation.R` - check bifurcation diagram
  - [ ] Troubleshoot any dependency issues (deSolve, ggplot2, etc.)
  - [ ] Generate all PDF outputs for presentation

- [ ] **Create Presentation**
  - [ ] Decide format: PowerPoint, Beamer slides, or HTML reveal.js?
  - [ ] Outline structure:
    1. Introduction: What is chaos? (3 features)
    2. Lorenz Attractor: Butterfly Effect demo
    3. Logistic Map: Period-doubling cascade
    4. Feigenbaum's Universality: δ ≈ 4.669
    5. Applications: Cognitive science connections
  - [ ] Embed visualizations in slides
  - [ ] Prepare talking points from study guide
  - [ ] Practice timing (10-15 minutes?)

- [ ] **Prepare for Q&A**
  - [ ] Review study guide key concepts
  - [ ] Prepare answers to likely questions:
    - "What's the difference between complicated and chaotic?"
    - "How does this apply to psychology?"
    - "Why can't we predict weather long-term?"
  - [ ] Have GitHub link ready to share

### Due Date: ???

---

## 🔬 Phase 3: Python Integration & GPU Acceleration

### Goals
- [ ] Convert R scripts to Python (NumPy, SciPy)
- [ ] Use TensorFlow with RTX 4090 for faster computation
- [ ] Create animated visualizations (Matplotlib, Plotly)
- [ ] Deploy interactive web app (Streamlit or Dash)

### Tasks
- [ ] Set up Python environment (conda/venv)
- [ ] Install: numpy, scipy, matplotlib, tensorflow-gpu
- [ ] Reimplement Lorenz equations in Python
- [ ] Reimplement logistic map in Python
- [ ] Create 3D animated Lorenz attractor
- [ ] Time-lapse bifurcation diagram animation
- [ ] GPU-accelerated parameter sweeps
- [ ] Deploy to web (optional - for portfolio)

### Expected Timeline
- Start after class presentation complete
- 2-3 weeks for full Python implementation
- GPU work depends on CUDA setup success

---

## 📊 Phase 4: Research Applications

### Cognitive Science Connections

#### Automaticity Research (Your Thesis Topic!)
- [ ] Model automaticity as attractors in state space
  - Learning = chaotic exploration
  - Skill acquisition = settling into attractor
  - Automaticity = stable strange attractor with flexibility
- [ ] Test for chaos in behavioral time series from RCSA grant data
- [ ] Calculate Lyapunov exponents for learning curves
- [ ] Bifurcation analysis: parameter changes → qualitative behavior shifts

#### Implicit Theories as Bifurcation Parameters
- [ ] Small belief changes → large behavioral changes (bifurcations)
- [ ] Model mindset (fixed vs. growth) as parameter in dynamical system
- [ ] Predict when small interventions will have large effects

#### Goal Pursuit Dynamics
- [ ] Goal-directed behavior as trajectories in state space
- [ ] Obstacles as perturbations (test sensitivity)
- [ ] Multiple goals = multiple attractors
- [ ] Goal switching = trajectory jumps between basins

#### Decision-Making Under Uncertainty
- [ ] Butterfly Effect in choices: small mood/context shifts → different decisions
- [ ] Model as chaotic neural dynamics
- [ ] Free will vs. determinism: chaos provides middle ground

### Research Questions Generated
1. Do learning curves exhibit chaotic dynamics before automaticity?
2. Can we predict skill acquisition failures using chaos indicators?
3. Are individual differences in automaticity related to sensitivity parameters?
4. Do interventions work better at bifurcation points?

### Data Analysis Tasks
- [ ] Load RCSA grant data (450+ participants)
- [ ] Calculate Lyapunov exponents from behavioral time series
- [ ] Test for deterministic chaos vs. random noise
- [ ] Identify bifurcations in learning trajectories
- [ ] Correlation: chaos indicators ↔ automaticity measures

---

## 🎓 Phase 5: PhD Applications

### Portfolio Pieces
- [x] GitHub repository demonstrating:
  - Advanced R programming
  - Mathematical modeling
  - Data visualization
  - Scientific communication
  - Independent learning

### Application Materials to Update
- [ ] **CV**: Add computational modeling skills
  - R (deSolve, ggplot2, tidyverse)
  - Python (NumPy, TensorFlow)
  - Mathematical modeling
  - Chaos theory & dynamical systems
  
- [ ] **Statement of Purpose**: Mention chaos theory connections
  - "My research integrates computational modeling with experimental psychology..."
  - "Understanding automaticity through dynamical systems theory..."
  - "Chaos theory provides framework for understanding behavioral variability..."

- [ ] **Writing Sample**: Consider paper on chaos & automaticity
  - Literature review: chaos in cognitive science
  - Methods: time series analysis of RCSA data
  - Results: evidence for/against chaos in skill acquisition
  - Discussion: implications for automaticity theory

### Target Programs (Social-Personality PhD)
- [ ] Identify programs with quantitative/computational faculty
- [ ] Look for advisors interested in:
  - Dynamical systems approaches
  - Computational modeling
  - Automaticity/habits research
  - Advanced statistics

---

## 📅 Timeline & Milestones

### Spring 2025
- [x] Week 1: Extract models from book
- [x] Week 2: Implement in R
- [x] Week 3: Create documentation
- [ ] Week 4: Class presentation
- [ ] Week 5-6: Python implementation
- [ ] Week 7-8: Apply to RCSA data

### Summer 2025
- [ ] June: Extended analysis with RCSA data
- [ ] July: Draft manuscript on chaos & automaticity
- [ ] August: Prepare PhD applications

### Fall 2025
- [ ] September: Submit PhD applications
- [ ] October-December: Interviews

---

## 🔧 Technical Requirements

### R Environment
- [x] R version: 4.x installed
- [x] RStudio: Latest version
- Required packages:
  - [x] deSolve (differential equations)
  - [x] ggplot2 (visualization)
  - [ ] plotly (interactive 3D - for R Markdown HTML)
  - [ ] gganimate (animations - optional)
  - [ ] rmarkdown (document generation)

### Python Environment (Future)
- [ ] Python 3.10+
- [ ] CUDA toolkit (for GPU)
- [ ] TensorFlow-GPU
- [ ] NumPy, SciPy, Matplotlib
- [ ] Jupyter notebooks

### Hardware
- [x] RTX 4090 GPU available
- [x] University supercomputer access
- [x] Sufficient RAM for large simulations

---

## 📚 References & Resources

### Primary Source
- Gleick, J. (1987). *Chaos: Making a New Science*. Viking Press.

### Original Papers
- Lorenz, E. N. (1963). Deterministic nonperiodic flow. *Journal of the Atmospheric Sciences*, 20(2), 130-141.
- May, R. M. (1976). Simple mathematical models with very complicated dynamics. *Nature*, 261(5560), 459-467.
- Feigenbaum, M. J. (1978). Quantitative universality for a class of nonlinear transformations. *Journal of Statistical Physics*, 19(1), 25-52.
- Mandelbrot, B. B. (1982). *The Fractal Geometry of Nature*. W.H. Freeman.

### Additional Reading
- Strogatz, S. H. (2015). *Nonlinear Dynamics and Chaos*. Westview Press.
- Devaney, R. L. (1989). *An Introduction to Chaotic Dynamical Systems*. Addison-Wesley.

### Online Resources
- [ ] Chaos tutorials on YouTube
- [ ] Interactive Lorenz attractor demos
- [ ] R chaos packages documentation

---

## 💡 Ideas for Extension

### Additional Models to Implement
- [ ] Mandelbrot Set (fractal visualization)
- [ ] Julia Sets (related fractals)
- [ ] Rössler Attractor (simpler chaos)
- [ ] Hénon Map (discrete strange attractor)
- [ ] Double Pendulum (mechanical chaos)
- [ ] Chua's Circuit (electronic chaos)

### Visualization Ideas
- [ ] 3D interactive Lorenz attractor (WebGL)
- [ ] Time-lapse of bifurcation diagram evolution
- [ ] Side-by-side: small difference → large divergence
- [ ] Phase space reconstruction from time series
- [ ] Poincaré sections of attractors
- [ ] Fractal dimension calculations

### Outreach & Communication
- [ ] Blog post: "Chaos Theory for Psychologists"
- [ ] Twitter thread with visualizations
- [ ] Poster for department research symposium
- [ ] Guest lecture for undergraduate stats class?

---

## 🐛 Known Issues / Troubleshooting

### R Setup Challenges
- [x] ~~GPU setup for deep learning~~ (unresolved but not critical for this project)
- [ ] If deSolve fails: check R version compatibility
- [ ] If plots don't render: verify graphics device settings
- [ ] If PDF output fails: check LaTeX installation (for R Markdown)

### Potential Presentation Issues
- [ ] File size of PDFs (might need compression)
- [ ] Projector resolution (test beforehand)
- [ ] R code execution time during live demo (pre-generate plots?)

---

## 📞 Resources & Support

### On Campus
- Dr. Mather (research advisor)
- UCO supercomputer support
- Statistics department (R help)

### Online Communities
- Stack Overflow (R programming questions)
- r/rstats (Reddit community)
- Cross Validated (statistics questions)

---

## 📝 Notes & Reflections

### What Worked Well
- Extracting models systematically from book text
- Using LaTeX for professional documentation
- Creating both technical and accessible versions (guide vs. code)
- GitHub for version control and portfolio

### Lessons Learned
- Start documentation early (helps organize thinking)
- R + Python integration is powerful but complex
- Visual communication crucial for mathematical concepts
- Connection to research interests makes project more meaningful

### Future Improvements
- Could add interactive Shiny app (R web interface)
- Video presentation might be good for portfolio
- More cognitive science examples in presentation
- Consider submitting to undergraduate research conference

---

## ✅ Success Criteria

### Minimum Viable Project (for Class)
- [x] Two models implemented in R
- [x] Documentation explaining models
- [ ] Class presentation delivered
- [ ] Code runs without errors

### Excellent Project (for Portfolio)
- [ ] All models work + beautiful visualizations
- [ ] Interactive HTML output
- [ ] Clear connections to psychology
- [ ] Polished GitHub repository
- [ ] Used in PhD applications

### Dream Project (Long-term)
- [ ] Published paper connecting chaos to automaticity
- [ ] Python + GPU implementation
- [ ] Web app with interactive chaos demos
- [ ] Cited in PhD application materials
- [ ] Influences thesis direction

---

## 🎯 Key Takeaways for Class Discussion

### The Three Features of Chaos
1. **Sensitive dependence on initial conditions** (Butterfly Effect)
2. **Deterministic** (exact equations, no randomness)
3. **Aperiodic** (never repeats)

### Operational Definitions
- **Complicated**: Many parts, predictable (jet engine)
- **Complex**: Emergent properties (ecosystem)
- **Chaotic**: Simple rules, unpredictable outcomes (weather)

### Determinism According to Gleick
- Classical view: deterministic = predictable
- Chaos revolution: deterministic ≠ predictable
- "Chaos eliminates the Laplacian fantasy of deterministic predictability"

---

*Last Updated: January 21, 2025*  
*Next Review: After class presentation*
