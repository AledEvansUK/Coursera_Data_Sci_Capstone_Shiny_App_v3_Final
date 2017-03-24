# Load packages for Shiny UI 
library(shiny)
library(shinythemes)

#### Shiny UI code

shinyUI <- fluidPage(theme=shinytheme("darkly"),
                     fluidPage(
                         # Title for Shiny App
                         headerPanel("Next Word Prediction - Coursera Capstone Project"),
                         
                         sidebarPanel(
                             hr(),
                             textInput("inputText", "Enter your text here:",value = "")
                         ),
                         
                         hr(),
                         
                         mainPanel(
                             hr(),
                             hr(),
                             h5("Suggested/ Predicted word:"),
                             verbatimTextOutput("prediction"))
                         
                     ),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'>Please input a word or phrase. The predictive algorithm outputs a suggestion for the next word using natural language processing (NLP) techniques.</div>")),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'><hr/><b></b></div>")),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'>This is the capstone project for the Data Science Specialization offered by <a href='https://www.coursera.org/learn/data-science-project'>Coursera & Johns Hopkins University - in association with Swiftkey.</a></div>")),
                                          fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'><a href='http://rpubs.com/aledevans/coursera_data_sci_capstone_v3_r_pres'>R Presentation Pitch.</a></div>")),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'>Further notes and code for data processing can be found in the <a href='https://rpubs.com/aledevans/Milestone_Report_Capstone_Project_Coursera'>Milestone Report.</a></div>")),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'>Code and documentation for this Shiny App and capstone project are also on <a href='https://github.com/AledEvansUK/Coursera_Data_Sci_Capstone_Shiny_App_v3_Final'>GitHub.</a></div>")),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'><hr/><b></b></div>")),
                     fluidRow(HTML("<div style='margin-left:50px;margin-bottom:10px;color:orange;'><b><em>Created by Aled Evans, March 2017.</em></b></div>"))
                     
)

