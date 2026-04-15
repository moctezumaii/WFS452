# app_server.R — Recruitment Dynamics Shiny App (Server)
# WFS 452 — Teaching recruitment from early life-history traits

server <- function(input, output, session) {


  # ---------- helper: deterministic recruitment ----------
  calc_deterministic <- function(N0, female_prop, fecundity,
                                 egg_survival, larval_survival, T_months) {
    females    <- N0 * female_prop
    eggs       <- females * fecundity
    larvae0    <- eggs * egg_survival
    recruitment <- larvae0 * (larval_survival ^ T_months)
    recruitment
  }

  # ---------- helper: one stochastic replicate ----------
  sim_one <- function(N0, female_prop, fecundity,
                      egg_survival, larval_survival, T_months, stability) {
    females <- N0 * female_prop
    eggs    <- round(females * fecundity)  # integer egg count

    # --- environment shock function ---
    adj_prob <- function(p_base) {
      if (stability >= 1) return(p_base)
      p_bad <- 1 - stability
      if (runif(1) < p_bad) {
        q <- runif(1, 0.1, 0.7)
        return(min(max(p_base * q, 0), 1))
      }
      p_base
    }

    # egg stage (binomial draw with possible env shock)
    p_egg_adj <- adj_prob(egg_survival)
    larvae <- rbinom(1, size = eggs, prob = p_egg_adj)

    # larval stage — monthly binomial survival
    for (m in seq_len(T_months)) {
      if (larvae <= 0) break
      p_larval_adj <- adj_prob(larval_survival)
      larvae <- rbinom(1, size = larvae, prob = p_larval_adj)
    }
    larvae
  }

  # ---------- reactive: deterministic result ----------
  det_recruitment <- reactive({
    calc_deterministic(input$N0, input$female_prop, input$fecundity,
                       input$egg_survival, input$larval_survival,
                       input$T_months)
  })

  # ---------- reactive: stochastic results ----------
  stoch_results <- reactive({
    req(input$stochastic)
    n_rep <- input$replicates
    replicate(n_rep, sim_one(input$N0, input$female_prop, input$fecundity,
                             input$egg_survival, input$larval_survival,
                             input$T_months, input$stability))
  })

  # ---------- output: deterministic summary ----------
  output$det_summary <- renderPrint({
    rec <- det_recruitment()
    cat("Females          :", input$N0 * input$female_prop, "\n")
    cat("Total eggs       :", input$N0 * input$female_prop * input$fecundity, "\n")
    cat("Larvae (post-egg):", input$N0 * input$female_prop * input$fecundity * input$egg_survival, "\n")
    cat("Expected recruits:", round(rec, 2), "\n")
  })

  # ---------- output: stochastic summary ----------
  output$stoch_summary <- renderPrint({
    req(input$stochastic)
    r   <- stoch_results()
    det <- det_recruitment()
    cat("Replicates       :", length(r), "\n")
    cat("Mean recruitment :", round(mean(r), 2), "\n")
    cat("Median           :", round(median(r), 2), "\n")
    cat("5th percentile   :", round(quantile(r, 0.05), 2), "\n")
    cat("95th percentile  :", round(quantile(r, 0.95), 2), "\n")
    cat("SD               :", round(sd(r), 2), "\n")
    pct_fail <- mean(r < det * 0.01) * 100
    cat("P(recruit < 1% of expected):", round(pct_fail, 1), "%\n")
  })

  # ---------- output: histogram ----------
  output$hist_plot <- renderPlot({
    req(input$stochastic)
    r   <- stoch_results()
    det <- det_recruitment()

    hist(r, breaks = 30, col = "steelblue", border = "white",
         main = "Distribution of Stochastic Recruitment",
         xlab = "Number of Recruits", ylab = "Frequency")
    abline(v = det, col = "red", lwd = 2, lty = 2)
    legend("topright",
           legend = c(paste0("Deterministic = ", round(det, 1)),
                      paste0("Mean = ", round(mean(r), 1))),
           col = c("red", NA), lty = c(2, NA), lwd = 2, bty = "n")
  })

  # ---------- output: sensitivity plot ----------
  output$sens_plot <- renderPlot({
    param <- input$sens_param
    n_pts <- 30

    # define range for chosen parameter
    rng <- switch(param,
      fecundity      = seq(1, max(2000, input$fecundity * 2), length.out = n_pts),
      egg_survival   = seq(0.01, 1, length.out = n_pts),
      larval_survival = seq(0.01, 1, length.out = n_pts),
      T_months       = seq(1, 24, length.out = n_pts),
      stability      = seq(0, 1, length.out = n_pts)
    )

    # compute deterministic recruitment over range
    rec_vals <- vapply(rng, function(v) {
      args <- list(N0 = input$N0,
                   female_prop    = input$female_prop,
                   fecundity      = input$fecundity,
                   egg_survival   = input$egg_survival,
                   larval_survival = input$larval_survival,
                   T_months       = input$T_months)
      args[[param]] <- v
      do.call(calc_deterministic, args)
    }, numeric(1))

    nice_label <- switch(param,
      fecundity       = "Fecundity (eggs/female)",
      egg_survival    = "Egg Survival Probability",
      larval_survival = "Larval Monthly Survival Probability",
      T_months        = "Months to Recruitment",
      stability       = "Environmental Stability"
    )

    plot(rng, rec_vals, type = "l", lwd = 2, col = "darkblue",
         xlab = nice_label, ylab = "Expected Recruitment",
         main = paste("Sensitivity:", nice_label))

    # current value marker
    cur <- switch(param,
      fecundity       = input$fecundity,
      egg_survival    = input$egg_survival,
      larval_survival = input$larval_survival,
      T_months        = input$T_months,
      stability       = input$stability
    )
    cur_rec <- det_recruitment()
    points(cur, cur_rec, pch = 19, col = "blue", cex = 2)
    text(cur, cur_rec, labels = paste0("(", round(cur, 2), ", ", round(cur_rec, 1), ")"),
         pos = 3, col = "blue", cex = 0.9)
  })
}
