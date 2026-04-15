# app_ui.R — Recruitment Dynamics Shiny App (UI)
# WFS 452 — Teaching recruitment from early life-history traits

ui <- fluidPage(
  titlePanel("Recruitment Dynamics Explorer"),

  sidebarLayout(
    sidebarPanel(
      width = 3,

      # -- Population parameters --
      h4("Population"),
      numericInput("N0", "Initial population (N\u2080):",
                   value = 1000, min = 1, step = 100),
      sliderInput("female_prop", "Proportion female:",
                  min = 0.1, max = 0.9, value = 0.5, step = 0.05),

      hr(),
      h4("Life-History Traits"),
      numericInput("fecundity", "Fecundity (eggs per female):",
                   value = 500, min = 1, step = 50),
      sliderInput("egg_survival", "Egg survival probability:",
                  min = 0, max = 1, value = 0.10, step = 0.01),
      sliderInput("larval_survival", "Larval monthly survival probability:",
                  min = 0, max = 1, value = 0.50, step = 0.01),
      sliderInput("T_months", "Time to recruitment (months):",
                  min = 1, max = 24, value = 6, step = 1),

      hr(),
      h4("Stochastic Simulation"),
      checkboxInput("stochastic", "Enable stochastic simulation", value = FALSE),
      conditionalPanel(
        condition = "input.stochastic == true",
        sliderInput("replicates", "Replicates:",
                    min = 10, max = 200, value = 50, step = 10),
        sliderInput("stability", "Environmental stability:",
                    min = 0, max = 1, value = 0.8, step = 0.05),
        helpText("Stability = 1: constant environment (binomial noise only).",
                 "Stability < 1: random bad months reduce survival probabilities.")
      ),

      hr(),
      h4("Sensitivity Analysis"),
      selectInput("sens_param", "X-axis parameter:",
                  choices = c("Fecundity"        = "fecundity",
                              "Egg survival"     = "egg_survival",
                              "Larval survival"  = "larval_survival",
                              "Months to recruit" = "T_months",
                              "Stability"        = "stability")),
      helpText("Shows deterministic recruitment across a range of the chosen parameter.")
    ),

    mainPanel(
      width = 9,
      tabsetPanel(
        tabPanel("Summary",
                 h4("Deterministic (expected) recruitment"),
                 verbatimTextOutput("det_summary"),
                 conditionalPanel(
                   condition = "input.stochastic == true",
                   h4("Stochastic recruitment summary"),
                   verbatimTextOutput("stoch_summary")
                 )
        ),
        tabPanel("Recruitment Distribution",
                 conditionalPanel(
                   condition = "input.stochastic == true",
                   plotOutput("hist_plot", height = "450px"),
                   helpText("Histogram of recruitment across stochastic replicates.",
                            "Red dashed line = deterministic expectation.")
                 ),
                 conditionalPanel(
                   condition = "input.stochastic == false",
                   helpText("Enable stochastic simulation to see the recruitment distribution.")
                 )
        ),
        tabPanel("Sensitivity",
                 plotOutput("sens_plot", height = "450px"),
                 helpText("Deterministic recruitment as a function of the selected parameter.",
                          "Blue dot shows the current parameter value.")
        )
      )
    )
  )
)
