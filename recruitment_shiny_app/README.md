# Recruitment Dynamics Shiny App

A lightweight Shiny application for **WFS 452** that lets students explore how
early life-history traits (fecundity, egg survival, larval survival, etc.)
shape recruitment patterns — including boom/bust vs. stable outcomes.

## Requirements

- **R** (≥ 4.0)
- **shiny** package (`install.packages("shiny")`)

No other packages are needed.

## How to Run

From RStudio, open the file and click Run App


## What the App Does

| Tab | Description |
|-----|-------------|
| **Summary** | Shows the deterministic (expected) recruitment and, when stochastic mode is enabled, summary statistics across replicates. |
| **Recruitment Distribution** | Histogram of stochastic recruitment outcomes with the deterministic expectation overlaid. |
| **Sensitivity** | Plots deterministic recruitment as a function of one user-selected parameter. |

### Key Parameters

- **N₀** – initial population size
- **Proportion female** – sex ratio
- **Fecundity** – eggs produced per female
- **Egg survival** – probability an egg survives to the larval stage
- **Larval monthly survival** – probability a larva survives each month
- **Time to recruitment (T)** – number of months larvae must survive
- **Stability** – environmental stability (1 = stable; < 1 = random bad months)
