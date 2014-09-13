library(shiny)
library(ggplot2)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

data<-read.csv("pca_data.csv")


shinyServer(function(input, output, session) {
    
    # Combine the selected variables into a new data frame
    selectedData <- reactive({
        data[, c(input$xcol, input$ycol)]
    }) 

    clusters <- reactive({
        set.seed(input$seed)
        kmeans(selectedData(), input$clusters)
    })
    
    output$plot1 <- renderPlot({
        Legend<- switch(input$color,
                       "Cluster"=clusters()$cluster,
                       "Classe"=data$classe,
                       "User Name"=data$user_name)
        
        myTitle<-paste("Principal Components and",input$color)
        
    q<-qplot(selectedData()[,1],selectedData()[,2],colour=Legend,data=selectedData())+geom_point()+
        xlab(input$xcol) + ylab(input$ycol)+labs(title = myTitle)+labs(color = input$color)
    q

 
    })
    
})

