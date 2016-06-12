library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predicting an Adult Child's Height"),
    sidebarPanel(
        h1("Input Data"),
        h4("Enter the data below:"),
        h5("Enter heights in inches and select the child's gender."),
        h5("Then click Submit."),
        numericInput("Father", "Father's Height (in.)", 0, min = 0, max = 120, step = 0.1),
        numericInput("Mother", "Mother's Height (in.)", 0, min = 0, max = 120, step = 0.1),
        radioButtons("Gender", "Child's Gender",
                           c("Female" = 0,
                             "Male" = 1)),
        submitButton("Submit")
    ),
    mainPanel(
        h3("Results of prediction"),
        h4("You entered Father's height (in.)"),
        verbatimTextOutput("Father"),
        h4("You entered Mother's height (in.)"),
        verbatimTextOutput("Mother"),
        h4("You entered the child's gender"),
        verbatimTextOutput("Gender"),
        h4("The predicted child's height (.in) as an adult:"),
        verbatimTextOutput("prediction"),
        h4("Notes:"),
        h5("The applicable range of Father's height is 62.0 to 78.5 in."),
        h5("The applicable range of Mother's height is 58.0 to 70.5 in."),
        h5("The predicted child's height may have unusual error,"),
        h5("when the parents's heights are outside these applicable ranges.")
    )
    
))
