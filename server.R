library(shiny)

childHeight <- function(Father, Mother, Gender) {
    modelCoefs = c(15.3887591, 0.4135088, 0.3129702, 5.2680190)
    gender <- ifelse(Gender == "1", 1, 0)
    prediction <- sum(modelCoefs * c(1, Father, Mother, gender))
    prediction <- round(prediction, digits = 1)
    return(prediction)
}

shinyServer(
    function(input, output) {
        output$Father = renderPrint({input$Father})
        output$Mother = renderPrint({input$Mother})
        gender <- reactive(ifelse(input$Gender == "1", "M", "F"))
        output$Gender = renderPrint({gender()})
        output$prediction = renderPrint({childHeight(input$Father, input$Mother, input$Gender)})
    }
)