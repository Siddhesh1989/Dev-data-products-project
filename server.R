library(shiny)
library(UsingR)
data(mtcars)
y<<-mtcars$mpg
x<<-mtcars$wt
shinyServer(
  function(input, output){
    output$dataplot<-renderPlot({
      #tempx<-x-mean(x)
      #tempy<-y-mean(y)
      fit<-lm(y~I(x*10))
      sumResidUser<-(sum(abs(y-input$intercept-input$slope*(x*10))))
      sumResidBestFit<-(sum(abs(y-coef(summary(fit))[1]-coef(summary(fit))[2]*(x*10))))
      plot(I(x*10), y, xlab='weight in 100s of lbs', ylab='miles per gallon')
      abline(coef=c(input$intercept, input$slope), col="blue")
      abline(coef=c(coef(summary(fit))[1], coef(summary(fit))[2]), col="red")
      text(45,30,paste("sum of residuals for the user selected model is ", sumResidUser))      
          
    })
    output$bestslope<-renderPrint(coef(summary(lm(y~I(x*10))))[2])
    output$bestintercept<-renderPrint(coef(summary(lm(y~I(x*10))))[1])
  }
)