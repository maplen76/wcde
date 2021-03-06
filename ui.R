library(markdown)
load("label.RData")

shinyUI(
  navbarPage(
    title=" ", #footer=source("intro_foot.R", local=TRUE)$value, 
    windowTitle="Wittgenstein Centre Data Explorer", collapsible=TRUE, fluid=FALSE,
    id='page',
    tabPanel(
      title = "Data Explorer",
      id='data_tabs',
      fluidRow(
        column(width = 8, includeMarkdown("md/intro_data.md")),
        column(width = 4, includeHTML("md/intro_logo.html"))
      ),
      br(),
      tabsetPanel(
        type = "tabs", 
        tabPanel("Selection", source("ui/data_select.R", local=TRUE)$value),
        tabPanel("Data", source("ui/data_show.R", local=TRUE)$value),
        tabPanel("Assumptions", source("ui/ass_select.R", local=TRUE)$value)
      )
    ),
    tabPanel(
      title = "Graphic Explorer",
      id='graphic_tabs',
      fluidRow(
        column(width = 8, includeMarkdown("md/intro_graphic.md")),
        column(width = 4, includeHTML("md/intro_logo.html"))
      ),
      br(),
      tabsetPanel(
        type = "tabs", 
        tabPanel("Pyramids", br(), source("ui/pyr_select.R", local=TRUE)$value),
        tabPanel("Population Size", br(), source("ui/sac_select.R", local=TRUE)$value),
        tabPanel("Map", br(), source("ui/map_select.R", local=TRUE)$value),
        tabPanel("Profile", br(), source("ui/prof_select.R", local=TRUE)$value),
        tabPanel("Output", verbatimTextOutput("temp"))
      )
    ),
    tabPanel(
      title = "About",
      id='about_tabs',
      fluidRow(
        column(width = 8, includeMarkdown("md/intro_about.md")),
        column(width = 4, includeHTML("md/intro_logo.html"))
      ),
      br(),
      tabsetPanel(
        type = "tabs", 
        tabPanel("Details", includeMarkdown("md/about_details.md")),
        tabPanel("FAQ", br(),
                 h4("General:"), dataTableOutput("about_faq2"),
                 h4("Data and Graphic Explorer:"), dataTableOutput("about_faq1")
                 ),
        tabPanel("Scenario Defintions", dataTableOutput("about_scenario"), includeMarkdown("md/about_scenario.md")),
        tabPanel("Education Definitions", dataTableOutput("about_edu"), includeMarkdown("md/about_edu.md"))
        #tabPanel("Output", verbatimTextOutput("temp"))
      )
    ),
    includeCSS("style.css"),
    tags$head(includeScript("google-analytics.js")),
    tags$script(includeHTML("sm-share.html")),
    tags$head(#tags$script(includeScript("C:/Users/gabel/Documents/shiny/wic2/nav.js"))
      tags$script(
        "Shiny.addCustomMessageHandler('updateSelections',
        function(data) {
        var nav_ref = '#page a:contains(\"' + data.nav + '\")';
        var tabpanel_id = data.nav == 'Alpha' ? '#data_tabs' : '#graphic_tabs';
        $(nav_ref).tab('show');
        })"
      )
    )
    #tags$script(includeHTML("twitter-share.html"))
  )
)

