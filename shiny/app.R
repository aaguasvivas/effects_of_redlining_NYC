#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(tidyverse)
library(shinythemes)
library(sf)

nymanhattan1937 <- read_rds("redlining_maps/manhattan/nymanhattan1937.rds")
nybronx1938 <- read_rds("redlining_maps/bronx/nybronx1938.rds")
nybrooklyn1938 <- read_rds("redlining_maps/brooklyn/nybrooklyn1938.rds")
nyqueens1938 <- read_rds("redlining_maps/queens/nyqueens1938.rds")
nystatenisland1940 <- read_rds("redlining_maps/statenisland/nystatenisland1940.rds")

manhattan_household_income_1950 <- read_rds("household_income/manhattan/1950/household_income_1950.rds")
manhattan_household_income_1960 <- read_rds("household_income/manhattan/1960/household_income_1960.rds")
manhattan_household_income_1970 <- read_rds("household_income/manhattan/1970/household_income_1970.rds")
manhattan_household_income_1980 <- read_rds("household_income/manhattan/1980/household_income_1980.rds")
manhattan_household_income_1990 <- read_rds("household_income/manhattan/1990/household_income_1990.rds")
manhattan_household_income_2000 <- read_rds("household_income/manhattan/2000/household_income_2000.rds")
manhattan_household_income_2010 <- read_rds("household_income/manhattan/2010/household_income_2010.rds")

bronx_household_income_1950 <- read_rds("household_income/bronx/1950/household_income_1950.rds")
bronx_household_income_1960 <- read_rds("household_income/bronx/1960/household_income_1960.rds")
bronx_household_income_1970 <- read_rds("household_income/bronx/1970/household_income_1970.rds")
bronx_household_income_1980 <- read_rds("household_income/bronx/1980/household_income_1980.rds")
bronx_household_income_1990 <- read_rds("household_income/bronx/1990/household_income_1990.rds")
bronx_household_income_2000 <- read_rds("household_income/bronx/2000/household_income_2000.rds")
bronx_household_income_2010 <- read_rds("household_income/bronx/2010/household_income_2010.rds")

brooklyn_household_income_1950 <- read_rds("household_income/brooklyn/1950/household_income_1950.rds")
brooklyn_household_income_1960 <- read_rds("household_income/brooklyn/1960/household_income_1960.rds")
brooklyn_household_income_1970 <- read_rds("household_income/brooklyn/1970/household_income_1970.rds")
brooklyn_household_income_1980 <- read_rds("household_income/brooklyn/1980/household_income_1980.rds")
brooklyn_household_income_1990 <- read_rds("household_income/brooklyn/1990/household_income_1990.rds")
brooklyn_household_income_2000 <- read_rds("household_income/brooklyn/2000/household_income_2000.rds")
brooklyn_household_income_2010 <- read_rds("household_income/brooklyn/2010/household_income_2010.rds")

queens_household_income_1950 <- read_rds("household_income/queens/1950/household_income_1950.rds")
queens_household_income_1960 <- read_rds("household_income/queens/1960/household_income_1960.rds")
queens_household_income_1970 <- read_rds("household_income/queens/1970/household_income_1970.rds")
queens_household_income_1980 <- read_rds("household_income/queens/1980/household_income_1980.rds")
queens_household_income_1990 <- read_rds("household_income/queens/1990/household_income_1990.rds")
queens_household_income_2000 <- read_rds("household_income/queens/2000/household_income_2000.rds")
queens_household_income_2010 <- read_rds("household_income/queens/2010/household_income_2010.rds")

staten_island_household_income_1950 <- read_rds("household_income/staten_island/1950/household_income_1950.rds")
staten_island_household_income_1960 <- read_rds("household_income/staten_island/1960/household_income_1960.rds")
staten_island_household_income_1970 <- read_rds("household_income/staten_island/1970/household_income_1970.rds")
staten_island_household_income_1980 <- read_rds("household_income/staten_island/1980/household_income_1980.rds")
staten_island_household_income_1990 <- read_rds("household_income/staten_island/1990/household_income_1990.rds")
staten_island_household_income_2000 <- read_rds("household_income/staten_island/2000/household_income_2000.rds")
staten_island_household_income_2010 <- read_rds("household_income/staten_island/2010/household_income_2010.rds")

manhattan_housing_value_1980 <- read_rds("housing_value/manhattan/1980/housing_value_1980.rds")
manhattan_housing_value_1990 <- read_rds("housing_value/manhattan/1990/housing_value_1990.rds")


# Define UI for application, we ask to display the image dist_plot as output.

ui <- fluidPage(theme = shinytheme("sandstone"),
    navbarPage("Effects of Redlining in NYC", 
              
tabPanel("Redlining Maps",
         column(7,
           tabsetPanel(
               tabPanel("Manhattan", 
                        h4("Redlining in Manhattan 1937"),
                        br(),
                        leafletOutput("nymanhattan1937"),
                        br(),
                        h5("Writing coming soon")),
               tabPanel("Bronx", 
                        h4("Redlining in Bronx 1938"),
                        br(),
                        leafletOutput("nybronx1938"),
                        br(),
                        h5("Writing coming soon")),
               tabPanel("Brooklyn", 
                        h4("Redlining in Brooklyn 1938"),
                        br(),
                        leafletOutput("nybrooklyn1938"),
                        br(),
                        h5("Writing coming soon")),
               tabPanel("Queens", 
                        h4("Redlining in Queens 1938"),
                        br(),
                        leafletOutput("nyqueens1938"),
                        br(),
                        h5("Writing coming soon")),
               tabPanel("Staten Island", 
                        h4("Redlining in Staten Island 1940"),
                        br(),
                        leafletOutput("nystatenisland1940"),
                        br(),
                        h5("Writing coming soon")))
)),


tabPanel("Change in Demographics Over Time",
         tabsetPanel(
             tabPanel("Manhattan", imageOutput("manhattan_change_animation")),
             tabPanel("Bronx", imageOutput("bronx_change_animation")),
             tabPanel("Brooklyn", imageOutput("brooklyn_change_animation")),
             tabPanel("Queens", imageOutput("queens_change_animation")),
             tabPanel("Staten Island", imageOutput("staten_island_change_animation")))

),

tabPanel("Median Household Income",
         sidebarPanel(
             sliderInput("year", "Year:",  
                         min = 1950, max = 2010, value = 1950, 
                         step = 10, sep = "", animate = TRUE)
         ),
         column(7,
                tabsetPanel(
                    
                    tabPanel("Manhattan", 
                             h4("Median Household Income in Manhattan"),
                             leafletOutput("manhattan_household_income_1950")),
                    tabPanel("Bronx", 
                             h4("Median Household Income in The Bronx"),
                             leafletOutput("bronx_household_income_1950")),
                    tabPanel("Brooklyn", 
                             h4("Median Household Income in Brooklyn"),
                             leafletOutput("brooklyn_household_income_1950")),
                    tabPanel("Queens", 
                             h4("Median Household Income in Queens"),
                             leafletOutput("queens_household_income_1950")),
                    tabPanel("Staten Island", 
                             h4("Median Household Income in Staten Island"),
                             leafletOutput("staten_island_household_income_1950"))
                    
                
))),



tabPanel("Housing Value",
         column(7,
                tabsetPanel(
                    tabPanel("Manhattan",
                             h4("Median Housing Value in Manhattan in 1980"),
                             leafletOutput("manhattan_housing_value_1980"),
                             h4("Median Housing Value in Manhattan in 1990"),
                             leafletOutput("manhattan_housing_value_1990"))
                             
         
         
))),


tabPanel("Predictions and Findings"
         
),



tabPanel("Background Information"
         

),



tabPanel("About Me",
         h1("About"),
         h5("Contact me at aaguasvivas@college.harvard.edu or connect with me on LinkedIn", 
            a("HERE", href="https://www.linkedin.com/in/aaguasvivas/")),
         br())

               )
)

# Define server logic, where we output our dist_plot, using renderImage and
# normalizePath, to find the file path, using list which returns a list with the
# filename, where we can also set the width and height for the image, finally
# telling shiny to not delete the file after outputting.

server <- function(input, output) {
    
    output$bronx_change_animation <- renderImage({
        
        bronx_change_over_time <- normalizePath(file.path('change_over_time_graphs/bronx_change_animation.gif'))
        
        # Return a list containing the filename, width and height
        
        list(src = bronx_change_over_time,
             width = 700,
             height = 600)
        
    }, deleteFile = FALSE)
    
    output$manhattan_change_animation <- renderImage({
        
        manhattan_change_over_time <- normalizePath(file.path('change_over_time_graphs/manhattan_change_animation.gif'))
        
        # Return a list containing the filename, width and height
        
        list(src = manhattan_change_over_time,
             width = 700,
             height = 600)
        
    }, deleteFile = FALSE)
    
    output$brooklyn_change_animation <- renderImage({
        
        brooklyn_change_over_time <- normalizePath(file.path('change_over_time_graphs/brooklyn_change_animation.gif'))
        
        # Return a list containing the filename, width and height
        
        list(src = brooklyn_change_over_time,
             width = 700,
             height = 600)
        
    }, deleteFile = FALSE)
    
    output$queens_change_animation <- renderImage({
        
        queens_change_over_time <- normalizePath(file.path('change_over_time_graphs/queens_change_animation.gif'))
        
        # Return a list containing the filename, width and height
        
        list(src = queens_change_over_time,
             width = 700,
             height = 600)
        
    }, deleteFile = FALSE)
    
    output$staten_island_change_animation <- renderImage({
        
        staten_island_change_over_time <- normalizePath(file.path('change_over_time_graphs/staten_island_change_animation.gif'))
        
        # Return a list containing the filename, width and height
        
        list(src = staten_island_change_over_time,
             width = 700,
             height = 600)
        
    }, deleteFile = FALSE)
    
    output$nymanhattan1937 <- renderLeaflet({
        factpal <- colorFactor(c("green","blue","yellow","red"), nymanhattan1937$holc_grade)
        leaflet(nymanhattan1937) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~factpal(holc_grade))
        
    })
    
    # Bronx
    
    output$nybronx1938 <- renderLeaflet({
        factpal <- colorFactor(c("green","blue","yellow","red", "orange"), nybronx1938$holc_grade)
        leaflet(nybronx1938) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~factpal(holc_grade))
        
    })
    
    # Brooklyn
    
    output$nybrooklyn1938 <- renderLeaflet({
        factpal <- colorFactor(c("green","blue","yellow","red"), nybrooklyn1938$holc_grade)
        leaflet(nybrooklyn1938) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~factpal(holc_grade))
        
    })
    
    # Queens
    
    output$nyqueens1938 <- renderLeaflet({
        factpal <- colorFactor(c("green","blue","yellow","red"), nyqueens1938$holc_grade)
        leaflet(nyqueens1938) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~factpal(holc_grade))
        
    })
    
    # Staten island
    
    output$nystatenisland1940 <- renderLeaflet({
        factpal <- colorFactor(c("green","blue","yellow","red"), nystatenisland1940$holc_grade)
        leaflet(nystatenisland1940) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~factpal(holc_grade))
        
    })
    
    output$manhattan_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            y = manhattan_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            y = manhattan_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            y = manhattan_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            y = manhattan_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            y = manhattan_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            y = manhattan_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            y = manhattan_household_income_2010$MedianHHIncome2010
        }
        pal <- colorNumeric("viridis", NULL)
        leaflet(manhattan_household_income_1950) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0)
        
    })
    
    output$bronx_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            y = bronx_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            y = bronx_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            y = bronx_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            y = bronx_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            y = bronx_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            y = bronx_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            y = bronx_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(bronx_household_income_1950) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0)
        
    }) 
    
    output$brooklyn_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            y = brooklyn_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            y = brooklyn_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            y = brooklyn_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            y = brooklyn_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            y = brooklyn_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            y = brooklyn_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            y = brooklyn_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(brooklyn_household_income_1950) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0)
        
    }) 
    
    output$queens_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            y = queens_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            y = queens_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            y = queens_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            y = queens_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            y = queens_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            y = queens_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            y = queens_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(queens_household_income_1950) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0)
        
    }) 
    
    output$staten_island_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            y = staten_island_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            y = staten_island_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            y = staten_island_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            y = staten_island_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            y = staten_island_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            y = staten_island_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            y = staten_island_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(staten_island_household_income_1950) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0)
        
    }) 
    
    
    output$manhattan_housing_value_1980 <- renderLeaflet({
        pal <- colorNumeric("viridis", NULL)
        leaflet(manhattan_housing_value_1980) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(HousingValue1980)) %>%
            addLegend(pal = pal, values = ~HousingValue1980, opacity = 1.0)
        
        
    })
    
    output$manhattan_housing_value_1990 <- renderLeaflet({
        pal <- colorNumeric("viridis", NULL)
        leaflet(manhattan_housing_value_1990) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(HousingValue1990)) %>%
            addLegend(pal = pal, values = ~HousingValue1990, opacity = 1.0)
        
        
    })
    
}

# Run the application 

shinyApp(ui = ui, server = server)

