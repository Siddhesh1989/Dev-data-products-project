library(shiny)
data(mtcars)
shinyUI(pageWithSidebar(
    headerPanel("Try out linear model fitting (mpg of cars vs weight)"),
    sidebarPanel(
      sliderInput('intercept', 'Intercept', value=37, min = 30, max = 40, step = 0.1),
      sliderInput('slope', 'change in mpg per 100 lbs increase in wt', value=-0.5, min = -2, max = 2, step = 0.01),
      submitButton('Submit')
      ),
    mainPanel(      
      h4('Plot of mileage of cars in mpg vs their weight in 100s of lbs'),
      p('Best fit model represented by the red line'),
      p('User defined linear regression model shown as the blue line'),
      plotOutput('dataplot'),
      p('Slope of best fit model'),
      verbatimTextOutput('bestslope'),
      p('Intercept of best fit model'),
      verbatimTextOutput('bestintercept'),
      includeHTML("Readme.html")
    )
  
))