# Make sure to load the shiny package
library(shiny)

ui <- fluidPage(
  titlePanel("This is a demonstration App"),
  sidebarLayout(
    sidebarPanel(
      textInput("txtInput", "Please type your full name here"),
      selectInput("slctInput", "Select your home country", choices = c("India", "Kenya", "UK", "USA"))
    ),
    mainPanel(
      p("Who you are"),
      textOutput("txtOutput"),
      textOutput("countryOutput")
    )
  )
)

server <- function(input, output) {
  output$txtOutput <- renderText({
    paste("Name:", input$txtInput)
  })
  
  output$countryOutput <- renderText({
    paste("Your country is:", input$slctInput)
  })
}

shinyApp(ui = ui, server = server)