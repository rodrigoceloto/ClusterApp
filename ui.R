library(shiny)
library(ggplot2)

legend<-c("Cluster","Classe","User Name")

shinyUI(pageWithSidebar(
    headerPanel('Exercise Performance Exploratory Analysis'),
    sidebarPanel(
        selectInput('xcol', 'X Variable', c("PC1","PC2","PC3","PC4","PC5")),
        selectInput('ycol', 'Y Variable', c("PC1","PC2","PC3","PC4","PC5"),
                    selected=c("PC2")),
        selectInput('color', 'Legend color', legend),
        sliderInput("clusters",
                    "Number of clusters:",
                    min = 1,
                    max = 10,
                    value = 5),
        numericInput('seed', 'Set Seed', 99999)
    ),
    mainPanel(
        plotOutput('plot1'),
        
        h3("Help documentation"),
        p("This app plots the principal componentes calculated from a dataset of Exercise performance."),
        p("You can choose which Principal Components you want to place in x-axis and y-axis."),
         p("You can also choose the color of plot points from three options: (a) Estimated cluster, (b) Classe variable and (c) User Name variable."),
        p("Is also optional the number of clusters calculated. Once cluster estimative is sensitive to the seed, you can change the seed to recalculate it."),
          p("The intent of this plot is to make an exploratory analysis to inspect visually if there is any unsupervised pattern in data that could be associated with the variable Classe."),
        p("As you can check using this app, the clusters are associated with the User Name variable but they are not related with the classe variable"),

        br(),    
        h4("Database information"),
        p("The database of this work is based on the following study:"),
        p("Ugulino, W.; Cardador, D.; Vega, K.; Velloso, E.; Milidiu, R.; Fuks, H. Wearable Computing: Accelerometers' Data Classification of Body Postures and Movements. Proceedings of 21st Brazilian Symposium on Artificial Intelligence. Advances in Artificial Intelligence - SBIA 2012. In: Lecture Notes in Computer Science. , pp. 52-61. Curitiba, PR: Springer Berlin / Heidelberg, 2012. ISBN 978-3-642-34458-9. DOI: 10.1007/978-3-642-34459-6_6."),
        p("Columns with NA values and DIV/0! values removed from the data. The reason for not using imputation was that in both cases the percentage of NA values and blank values in those variables were bigger than 50%. After removing these columns it remained 52 predictor variables from the original 152 potential ones."),
        p("The predictor variables (all variables except classe variable) were preprocessed by the methods of CARET package “YeoJohnson”,“center”, “scale”,“pca”. The purpose of preprocessing was respectively: “symmetry”, “centering”, “scaling” and “dimensional reduction”."),
        p("After transformation a database of the first five principal components was created for this app.")

    )
))