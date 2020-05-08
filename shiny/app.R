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

manhattan_housing_value_1950 <- read_rds("housing_value/manhattan/1950/housing_value_1950.rds")
manhattan_housing_value_1960 <- read_rds("housing_value/manhattan/1960/housing_value_1960.rds")
manhattan_housing_value_1970 <- read_rds("housing_value/manhattan/1970/housing_value_1970.rds")
manhattan_housing_value_1980 <- read_rds("housing_value/manhattan/1980/housing_value_1980.rds")
manhattan_housing_value_1990 <- read_rds("housing_value/manhattan/1990/housing_value_1990.rds")
manhattan_housing_value_2000 <- read_rds("housing_value/manhattan/2000/housing_value_2000.rds")
manhattan_housing_value_2010 <- read_rds("housing_value/manhattan/2010/housing_value_2010.rds")

bronx_housing_value_1950 <- read_rds("housing_value/bronx/1950/housing_value_1950.rds")
bronx_housing_value_1960 <- read_rds("housing_value/bronx/1960/housing_value_1960.rds")
bronx_housing_value_1970 <- read_rds("housing_value/bronx/1970/housing_value_1970.rds")
bronx_housing_value_1980 <- read_rds("housing_value/bronx/1980/housing_value_1980.rds")
bronx_housing_value_1990 <- read_rds("housing_value/bronx/1990/housing_value_1990.rds")
bronx_housing_value_2000 <- read_rds("housing_value/bronx/2000/housing_value_2000.rds")
bronx_housing_value_2010 <- read_rds("housing_value/bronx/2010/housing_value_2010.rds")

brooklyn_housing_value_1950 <- read_rds("housing_value/brooklyn/1950/housing_value_1950.rds")
brooklyn_housing_value_1960 <- read_rds("housing_value/brooklyn/1960/housing_value_1960.rds")
brooklyn_housing_value_1970 <- read_rds("housing_value/brooklyn/1970/housing_value_1970.rds")
brooklyn_housing_value_1980 <- read_rds("housing_value/brooklyn/1980/housing_value_1980.rds")
brooklyn_housing_value_1990 <- read_rds("housing_value/brooklyn/1990/housing_value_1990.rds")
brooklyn_housing_value_2000 <- read_rds("housing_value/brooklyn/2000/housing_value_2000.rds")
brooklyn_housing_value_2010 <- read_rds("housing_value/brooklyn/2010/housing_value_2010.rds")

queens_housing_value_1950 <- read_rds("housing_value/queens/1950/housing_value_1950.rds")
queens_housing_value_1960 <- read_rds("housing_value/queens/1960/housing_value_1960.rds")
queens_housing_value_1970 <- read_rds("housing_value/queens/1970/housing_value_1970.rds")
queens_housing_value_1980 <- read_rds("housing_value/queens/1980/housing_value_1980.rds")
queens_housing_value_1990 <- read_rds("housing_value/queens/1990/housing_value_1990.rds")
queens_housing_value_2000 <- read_rds("housing_value/queens/2000/housing_value_2000.rds")
queens_housing_value_2010 <- read_rds("housing_value/queens/2010/housing_value_2010.rds")

staten_island_housing_value_1950 <- read_rds("housing_value/staten_island/1950/housing_value_1950.rds")
staten_island_housing_value_1960 <- read_rds("housing_value/staten_island/1960/housing_value_1960.rds")
staten_island_housing_value_1970 <- read_rds("housing_value/staten_island/1970/housing_value_1970.rds")
staten_island_housing_value_1980 <- read_rds("housing_value/staten_island/1980/housing_value_1980.rds")
staten_island_housing_value_1990 <- read_rds("housing_value/staten_island/1990/housing_value_1990.rds")
staten_island_housing_value_2000 <- read_rds("housing_value/staten_island/2000/housing_value_2000.rds")
staten_island_housing_value_2010 <- read_rds("housing_value/staten_island/2010/housing_value_2010.rds")

picture <- "about/githubprofile.jpg"


# Define UI for application, we ask to display the image dist_plot as output.

ui <- fluidPage(theme = shinytheme("cosmo"),
    navbarPage("Effects of Redlining in NYC", 
              
tabPanel("Redlining Maps",
         column(10,
           tabsetPanel(
               tabPanel("Manhattan", 
                        h4("Redlining in Manhattan 1937"),
                        br(),
                        leafletOutput("nymanhattan1937")),
               tabPanel("Bronx", 
                        h4("Redlining in Bronx 1938"),
                        br(),
                        leafletOutput("nybronx1938")),
               tabPanel("Brooklyn", 
                        h4("Redlining in Brooklyn 1938"),
                        br(),
                        leafletOutput("nybrooklyn1938")),
               tabPanel("Queens", 
                        h4("Redlining in Queens 1938"),
                        br(),
                        leafletOutput("nyqueens1938")),
               tabPanel("Staten Island", 
                        h4("Redlining in Staten Island 1940"),
                        br(),
                        leafletOutput("nystatenisland1940"))),
           h3("Things to Point Out:"),
           h4("- Meaning of the different colors: 'Green' means 'Best', 'Blue' means 'Still Desirable', 'Yellow' means 'Definitely Declining', 'Red' means 'Dangerous/Hazardous'."),
           h4("- There is one area in the Bronx Redlining Map colored as 'Orange' because in the actual maps, from the late 1930s, it was deemed as worse than 'Red' or seen as worse than 'Dangerous'. It was essentially telling mortgage lenders to stay away from this one area at all costs. "),
           h4("- Communities of color, with increasing or high percentages of Black and Latinx populations are way more likely to be labeled as 'Definitely Declining' or 'Dangerous/Hazardous'."), 
           h4("- Most boroughs experience strong, discriminatory and racist forms of redlining, except for Staten Island, for which we see an increase in the White population after 1940-1950, as seen in the 'Change in Demographics Tab'. This is because, like many suburbs, Staten Island becomes one of the main destinations to move to, because as seen in the map, a lot of its territory had properties that were not immediately affected by redlining, compared to places like the Bronx, Queens or Brooklyn, with increasing numbers of Black/Latinx people, which causes most of these boroughs to be labeled in those 'Red' and 'Yellow' colors."),
           h4("- If we compare these 'Redlining Maps' to other maps, like 'Median Household Income' or 'Median Housing Value', and we focus on the areas that are 'Yellow' or 'Red', you will notice that regardless of how much time passes, in general, these areas remain the most poor, with the lowest housing value. For example, look at the 'Green' area of Manhattan around 'Central Park', and look at how both the median household income and median housing value stay up at an Upper Middle Class level, while the area in 'Red' right above it and around it remains at that lower bracket, in terms of median household income and housing value, over time, disproportionately living in poverty."),
           h4(strong("- 91 percent of areas classified as 'Best', colored in 'Green' in the late 1930s and early 1940s, remain middle-to-upper-income today, and 85 percent of them are still predominantly white."))
)),


tabPanel("Change in Demographics Over Time",
         column(7,
         tabsetPanel(
             tabPanel("Manhattan", imageOutput("manhattan_change_animation")),
             tabPanel("Bronx", imageOutput("bronx_change_animation")),
             tabPanel("Brooklyn", imageOutput("brooklyn_change_animation")),
             tabPanel("Queens", imageOutput("queens_change_animation")),
             tabPanel("Staten Island", imageOutput("staten_island_change_animation")))),
         column(5,
                h3("Trends:"),
                h4("- For every borough, except for Staten Island, we see a steep decline in the White population after the years 1940 and 1950. This is almost immediately after redlining starts to take place. This is known as 'White Flight'. 'White Flight' is the mass migration of White people, usually from urban areas to more suburban cities/towns, based mostly on the fact that these urban areas are becoming more racially and ethnoculturally diverse. Racial, Ethnic and Religious minorities were often denied housing and business loans, as the Underwriting Manual of the Federal Housing Administration, said that 'incompatible racial groups should not be permitted to live in the same communities'. With this mass migration, White people have the ability to acquire wealth by investing in housing and business, effectively taking these resources and capital away from these urban areas, only worsening the wealth gap between them."),
                h4("- As seen in the plot, from 1940 to 1950, there is this quick spike in the White population in Staten Island, as 'White Flight' begins to happen, with Staten Island being one of the places they move to. The opposite happens in the plots for the other boroughs where we a steep decline in the 'White Population' after the years Redlining begins to happen, with the drop usually occurring between 1940 and 1960, for all of them."))

),

tabPanel("Median Household Income",
         sidebarPanel(
             sliderInput("year", "Year:",  
                         min = 1950, max = 2010, value = 1950, 
                         step = 10, sep = "", animate = TRUE),
             h4("NOTE:"),
             h5("- The Median Household Income is in US Dollars, but not adjusted for inflation, as time passes, meaning that the values are the actual incomes for the time, but would be different in today's dollars."),
             h5("- For these Median Household Incomes, the values range from 'Poor', being the lower values, to 'Middle' to 'Upper Middle' Class, being the higher values in the spectrum.")
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
                             leafletOutput("staten_island_household_income_1950"))), 
                h3("Findings:"),
                h4("- If we look at ")
                )
         ),



tabPanel("Median Housing Value",
         sidebarPanel(
             sliderInput("year_housing_value", "Year:",  
                         min = 1950, max = 2010, value = 1950, 
                         step = 10, sep = "", animate = TRUE),
             h4("NOTE:"),
             h5("- 1970 bad")
         ),
         column(7,
                tabsetPanel(
                    
                    tabPanel("Manhattan", 
                             h4("Median Housing Value in Manhattan"),
                             leafletOutput("manhattan_housing_value_1950")),
                    tabPanel("Bronx", 
                             h4("Median Housing Value in The Bronx"),
                             leafletOutput("bronx_housing_value_1950")),
                    tabPanel("Brooklyn", 
                             h4("Median Housing Value in Brooklyn"),
                             leafletOutput("brooklyn_housing_value_1950")),
                    tabPanel("Queens", 
                             h4("Median Housing Value in Queens"),
                             leafletOutput("queens_housing_value_1950")),
                    tabPanel("Staten Island", 
                             h4("Median Housing Value in Staten Island"),
                             leafletOutput("staten_island_housing_value_1950"))),
                h3("Findings:"),
                h4("- If we look at ")
                )
         ),


tabPanel("Predictions and Findings"
         
),



tabPanel("Background Information"
         

),



tabPanel("About Me",
         HTML("<center href='https://ibb.co/5vrC2s3'><img src='https://i.ibb.co/GkWGFCD/githubprofile.jpg' alt='githubprofile' width='325' height='400' border='0'></center>"),
         br(),
         h2("About Me"),
         h5("- Hello everyone! My name is Adelson Aguasvivas. I am a Junior at Harvard College, from the Dominican Republic/New York studying Computer Science, with a secondary in Ethnicity, Migration and Rights. I have a strong passion for software engineering, data science and education, and hope to keep working in these types of projects in future."),
         h5("- The desire to work on this project came out of personal experiences. Having moved from the Dominican Republic, to live in the Bronx with my grandmother, and having gone to middle school there for a short period of time, before moving to Newburgh, New York, made me wonder why the borough was set up in the way it was. Why was it that so many of my friends and their families seemed to be pushed to the margins of the city, facing poverty and generations of struggle? In the next few years, I would go on to learn about redlining and its effects, seeing the consequences of this racist and discriminatory practice, first hand. I have always wanted to visualize what these redlining maps looked like, and how it affected the five New York City boroughs over time, from 1950 to 2010. This is what I set my goal to be for this project. My hope is that this project will make information about this practice more readily and widely available, as well as provide a visualization tool, to actually see, in a map, the areas affected."),
         h2("Contact Information"),
         br(),
         h5("- Email: aaguasvivas@college.harvard.edu"),
         br(),
         h5("- Connect with me on LinkedIn here: ", 
            a("https://www.linkedin.com/in/aaguasvivas/", href="https://www.linkedin.com/in/aaguasvivas/")),
         br(),
         h5("- Checkout my Github Profile: ", 
            a("https://github.com/aaguasvivas", href="https://github.com/aaguasvivas")),
         br(),
         h5("- To directly access the Github Repo, click here: ", 
            a(" https://github.com/aaguasvivas/effects_of_redlining_NYC", href="https://github.com/aaguasvivas/effects_of_redlining_NYC")),
         br())
            

))

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
            income_data = manhattan_household_income_1950
            y = manhattan_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            income_data = manhattan_household_income_1960
            y = manhattan_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            income_data = manhattan_household_income_1970
            y = manhattan_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            income_data = manhattan_household_income_1980
            y = manhattan_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            income_data = manhattan_household_income_1990
            y = manhattan_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            income_data = manhattan_household_income_2000
            y = manhattan_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            income_data = manhattan_household_income_2010
            y = manhattan_household_income_2010$MedianHHIncome2010
        }
        pal <- colorNumeric("viridis", NULL)
        leaflet(income_data) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Household Income")
        
    })
    
    output$bronx_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            income_data = bronx_household_income_1950
            y = bronx_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            income_data = bronx_household_income_1960
            y = bronx_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            income_data = bronx_household_income_1970
            y = bronx_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            income_data = bronx_household_income_1980
            y = bronx_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            income_data = bronx_household_income_1990
            y = bronx_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            income_data = bronx_household_income_2000
            y = bronx_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            income_data = bronx_household_income_2010
            y = bronx_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(income_data) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Household Income")
        
    }) 
    
    output$brooklyn_household_income_1950 <- renderLeaflet({
        
        if(input$year == 1950) {
            income_data = brooklyn_household_income_1950
            y = brooklyn_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            income_data = brooklyn_household_income_1960
            y = brooklyn_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            income_data = brooklyn_household_income_1970
            y = brooklyn_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            income_data = brooklyn_household_income_1980
            y = brooklyn_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            income_data = brooklyn_household_income_1990
            y = brooklyn_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            income_data = brooklyn_household_income_2000
            y = brooklyn_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            income_data = brooklyn_household_income_2010
            y = brooklyn_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(income_data) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Household Income")
        
    }) 
    
    output$queens_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            income_data = queens_household_income_1950
            y = queens_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            income_data = queens_household_income_1960
            y = queens_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            income_data = queens_household_income_1970
            y = queens_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            income_data = queens_household_income_1980
            y = queens_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            income_data = queens_household_income_1990
            y = queens_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            income_data = queens_household_income_2000
            y = queens_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            income_data = queens_household_income_2010
            y = queens_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(income_data) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Household Income")
        
    }) 
    
    output$staten_island_household_income_1950 <- renderLeaflet({
        if(input$year == 1950) {
            income_data = staten_island_household_income_1950
            y = staten_island_household_income_1950$MedianHHIncome1949
        }
        if(input$year == 1960) {
            income_data = staten_island_household_income_1960
            y = staten_island_household_income_1960$MedianIncome1960
        }
        if(input$year == 1970) {
            income_data = staten_island_household_income_1970
            y = staten_island_household_income_1970$MedianIncome1970
        }
        if(input$year == 1980) {
            income_data = staten_island_household_income_1980
            y = staten_island_household_income_1980$MedianHHIncome1979
        }
        if(input$year == 1990) {
            income_data = staten_island_household_income_1990
            y = staten_island_household_income_1990$MedianHHIncome1989
        }
        if(input$year == 2000) {
            income_data = staten_island_household_income_2000
            y = staten_island_household_income_2000$MedianHHIncome1999
        }
        if(input$year == 2010) {
            income_data = staten_island_household_income_2010
            y = staten_island_household_income_2010$MedianHHIncome2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(income_data) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Household Income")
        
    }) 
    
    
    output$manhattan_housing_value_1950 <- renderLeaflet({
        if(input$year_housing_value == 1950) {
            borough_and_year = manhattan_housing_value_1950
            y = manhattan_housing_value_1950$HousingValue1950
        }
        if(input$year_housing_value == 1960) {
            borough_and_year = manhattan_housing_value_1960
            y = manhattan_housing_value_1960$MedianHousingValue1960
        }
        if(input$year_housing_value == 1970) {
            borough_and_year = manhattan_housing_value_1970
            y = manhattan_housing_value_1970$MedianHousingValue1970
        }
        if(input$year_housing_value == 1980) {
            borough_and_year = manhattan_housing_value_1980
            y = manhattan_housing_value_1980$HousingValue1980
        }
        if(input$year_housing_value == 1990) {
            borough_and_year = manhattan_housing_value_1990
            y = manhattan_housing_value_1990$HousingValue1990
        }
        if(input$year_housing_value == 2000) {
            borough_and_year = manhattan_housing_value_2000
            y = manhattan_housing_value_2000$HousingValue2000
        }
        if(input$year_housing_value == 2010) {
            borough_and_year = manhattan_housing_value_2010
            y = manhattan_housing_value_2010$HousingValue2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(borough_and_year) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Housing Value")
        
    }) 
    
    output$bronx_housing_value_1950 <- renderLeaflet({
        if(input$year_housing_value == 1950) {
            borough_and_year = bronx_housing_value_1950
            y = bronx_housing_value_1950$HousingValue1950
        }
        if(input$year_housing_value == 1960) {
            borough_and_year = bronx_housing_value_1960
            y = bronx_housing_value_1960$MedianHousingValue1960
        }
        if(input$year_housing_value == 1970) {
            borough_and_year = bronx_housing_value_1970
            y = bronx_housing_value_1970$MedianHousingValue1970
        }
        if(input$year_housing_value == 1980) {
            borough_and_year = bronx_housing_value_1980
            y = bronx_housing_value_1980$HousingValue1980
        }
        if(input$year_housing_value == 1990) {
            borough_and_year = bronx_housing_value_1990
            y = bronx_housing_value_1990$HousingValue1990
        }
        if(input$year_housing_value == 2000) {
            borough_and_year = bronx_housing_value_2000
            y = bronx_housing_value_2000$HousingValue2000
        }
        if(input$year_housing_value == 2010) {
            borough_and_year = bronx_housing_value_2010
            y = bronx_housing_value_2010$HousingValue2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(borough_and_year) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Housing Value")
        
    }) 
    
    output$brooklyn_housing_value_1950 <- renderLeaflet({
        if(input$year_housing_value == 1950) {
            borough_and_year = brooklyn_housing_value_1950
            y = brooklyn_housing_value_1950$HousingValue1950
        }
        if(input$year_housing_value == 1960) {
            borough_and_year = brooklyn_housing_value_1960
            y = brooklyn_housing_value_1960$MedianHousingValue1960
        }
        if(input$year_housing_value == 1970) {
            borough_and_year = brooklyn_housing_value_1970
            y = brooklyn_housing_value_1970$MedianHousingValue1970
        }
        if(input$year_housing_value == 1980) {
            borough_and_year = brooklyn_housing_value_1980
            y = brooklyn_housing_value_1980$HousingValue1980
        }
        if(input$year_housing_value == 1990) {
            borough_and_year = brooklyn_housing_value_1990
            y = brooklyn_housing_value_1990$HousingValue1990
        }
        if(input$year_housing_value == 2000) {
            borough_and_year = brooklyn_housing_value_2000
            y = brooklyn_housing_value_2000$HousingValue2000
        }
        if(input$year_housing_value == 2010) {
            borough_and_year = brooklyn_housing_value_2010
            y = brooklyn_housing_value_2010$HousingValue2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(borough_and_year) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Housing Value")
        
    }) 
    
    output$queens_housing_value_1950 <- renderLeaflet({
        if(input$year_housing_value == 1950) {
            borough_and_year = queens_housing_value_1950
            y = queens_housing_value_1950$HousingValue1950
        }
        if(input$year_housing_value == 1960) {
            borough_and_year = queens_housing_value_1960
            y = queens_housing_value_1960$MedianHousingValue1960
        }
        if(input$year_housing_value == 1970) {
            borough_and_year = queens_housing_value_1970
            y = queens_housing_value_1970$MedianHousingValue1970
        }
        if(input$year_housing_value == 1980) {
            borough_and_year = queens_housing_value_1980
            y = queens_housing_value_1980$HousingValue1980
        }
        if(input$year_housing_value == 1990) {
            borough_and_year = queens_housing_value_1990
            y = queens_housing_value_1990$HousingValue1990
        }
        if(input$year_housing_value == 2000) {
            borough_and_year = queens_housing_value_2000
            y = queens_housing_value_2000$HousingValue2000
        }
        if(input$year_housing_value == 2010) {
            borough_and_year = queens_housing_value_2010
            y = queens_housing_value_2010$HousingValue2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(borough_and_year) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Housing Value")
        
    }) 
    
    output$staten_island_housing_value_1950 <- renderLeaflet({
        if(input$year_housing_value == 1950) {
            borough_and_year = staten_island_housing_value_1950
            y = staten_island_housing_value_1950$HousingValue1950
        }
        if(input$year_housing_value == 1960) {
            borough_and_year = staten_island_housing_value_1960
            y = staten_island_housing_value_1960$MedianHousingValue1960
        }
        if(input$year_housing_value == 1970) {
            borough_and_year = staten_island_housing_value_1970
            y = staten_island_housing_value_1970$MedianHousingValue1970
        }
        if(input$year_housing_value == 1980) {
            borough_and_year = staten_island_housing_value_1980
            y = staten_island_housing_value_1980$HousingValue1980
        }
        if(input$year_housing_value == 1990) {
            borough_and_year = staten_island_housing_value_1990
            y = staten_island_housing_value_1990$HousingValue1990
        }
        if(input$year_housing_value == 2000) {
            borough_and_year = staten_island_housing_value_2000
            y = staten_island_housing_value_2000$HousingValue2000
        }
        if(input$year_housing_value == 2010) {
            borough_and_year = staten_island_housing_value_2010
            y = staten_island_housing_value_2010$HousingValue2010
        }
        
        pal <- colorNumeric("viridis", NULL)
        leaflet(borough_and_year) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
                        fillColor = ~pal(y)) %>%
            addLegend(pal = pal, values = ~y, opacity = 1.0, title = "Median Housing Value")
        
    })
    
}

# Run the application 

shinyApp(ui = ui, server = server)

