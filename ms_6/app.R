#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application, we ask to display the image dist_plot as output.

ui <- fluidPage(
    imageOutput("bronx_change_animation")
)

# Define server logic, where we output our dist_plot, using renderImage and
# normalizePath, to find the file path, using list which returns a list with the
# filename, where we can also set the width and height for the image, finally
# telling shiny to not delete the file after outputting.

server <- function(input, output) {
    
    output$bronx_change_animation <- renderImage({
        
        bronx_change_over_time <- normalizePath(file.path('bronx_change_animation.gif'))
        
        # Return a list containing the filename, width and height
        
        list(src = bronx_change_over_time,
             width = 700,
             height = 600)
        
    }, deleteFile = FALSE)
}

# Run the application 

shinyApp(ui = ui, server = server)
