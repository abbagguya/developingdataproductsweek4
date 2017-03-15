# Developing Data Products Project
# James Kim
# 2017-03-15

library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    headerPanel(h3(em("A Normal Exploration ..."))),
    sidebarPanel(width=4,
                 tabsetPanel(
                     tabPanel(h6("Hypothesis Testing"),
                              sliderInput(inputId="binw",label=h6("Binning Width"),0.1,1,0.1,0.1,200),
                              tabsetPanel(
                                  tabPanel(h6("Green"),
                                           sliderInput(inputId="p.pnts",label=h6("Number of Points"),0,1000,1000,10,200),
                                           sliderInput(inputId="p.mean",label=h6("Mean"),-10,10,0,0.01,200),
                                           sliderInput(inputId="p.sdev",label=h6("Standard Deviation"),1,3,1,0.01,200)
                                  ),
                                  tabPanel(h6("Pink"),
                                           sliderInput(inputId="g.pnts",label=h6("Number of Points"),0,1000,1000,10,200),
                                           sliderInput(inputId="g.mean",label=h6("Mean"),-10,10,0,0.01,200),
                                           sliderInput(inputId="g.sdev",label=h6("Standard Deviation"),1,3,1,0.01,200)
                                  )
                              )
                     ),
                     tabPanel(h6("K-Means Clustering"),
                              br(),
                              tabsetPanel(
                                  tabPanel(h6("Red"),
                                           sliderInput(inputId="d1.pnts",label=h6("Number of Points"),0,250,250,10,200),
                                           br(),
                                           sliderInput(inputId="x1.mean",label=h6("X-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="x1.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01,200),
                                           sliderInput(inputId="y1.mean",label=h6("Y-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="y1.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01,200)
                                  ),
                                  tabPanel(h6("Green"),
                                           sliderInput(inputId="d2.pnts",label=h6("Number of Points"),0,250,250,10,200),
                                           br(),
                                           sliderInput(inputId="x2.mean",label=h6("X-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="x2.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01,200),
                                           sliderInput(inputId="y2.mean",label=h6("Y-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="y2.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01,200)
                                  ),
                                  tabPanel(h6("Blue"),
                                           sliderInput(inputId="d3.pnts",label=h6("Number of Points"),0,250,250,10,200),
                                           br(),
                                           sliderInput(inputId="x3.mean",label=h6("X-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="x3.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01,200),
                                           sliderInput(inputId="y3.mean",label=h6("Y-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="y3.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01,200)
                                  ),
                                  tabPanel(h6("Purple"),
                                           sliderInput(inputId="d4.pnts",label=h6("Number of Points"),0,250,250,10,200),
                                           br(),
                                           sliderInput(inputId="x4.mean",label=h6("X-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="x4.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01,200),
                                           sliderInput(inputId="y4.mean",label=h6("Y-Mean"),-5,5,0,0.01,200),
                                           sliderInput(inputId="y4.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01,200)
                                  )
                              )
                     )
                 )
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Normally Exploring ...",
                     br(),
                     h3("Explore statistical properties of the normal distribution!"),
                     br(),
                     h4("A. Hypothesis Testing"),
                     h5("Choose the Hypothesis Testing tab in the main panel and the Hypothesis Testing tab in the side bar panel to manipulate two normal distributions and see results of Student's T-testing on them. The null hypothesis is that the mean of the pink distribution is greater than or equal to the mean of the green distribution"),
                     h5("Distribution is selectable by choosing the Green or Pink tab."),
                     h5("For each distribution, Number of Points (samples), Mean, and Standard Deviation are adjustable parameters."),
                     h5("For the histogram plot, Binning Width can be adjusted for the histogram plot."),
                     br(),
                     h4("B. K-Means Clustering"),
                     h5("Choose the K-Means Clustering tab in the main panel and the K-Means Clustering tab in the side bar panel to manipulate four normal distributions on an XY plane and see results of K-Means Clustering on them."),
                     h5("Distribution is selectable by choosing the Red, Green, Blue, or Purple tab."),
                     h5("For each distribution, Number of Points (samples), Mean, and Standard Deviation are adjustable parameters."),
                     br(),
                     h5("The panels in this Shiny application are well layed out in a Chrome browser page on a 15-inch Macbook Pro."),
                     h6("A Normal Exploration ... app is designed and written by James Kim (March 15, 2017).")
                     
                     
            ),
            tabPanel("Hypothesis Thesting",br(),
                     plotOutput(outputId="hist",width="870px",height="400px"),
                     h5("Adjust the parameters under the Hypothesis Testing tab in the side bar panel. Hypothesis testing clearly depends on intersection and number of points (sample size), especially for small number of points."),
                     h5("Student's T-test is performed on the two normal distributions for which the null hypothesis is that the mean of the pink distribution is greater than or equal to the mean of the green distribution. If the 95% Confidence-Interval T-test is passed, then the null hypothesis is rejected, i.e. the mean of the green distribution is greater than the mean of the pink distribution. For large number of points, it is remarkable how close the distributions can be with the hypothesis being rejected. On the other hand, for small number of points (for which the T-distribution is appropriate), rejection of the null hypothesis is more sporadic near the threshold, as expected.")
            ),
            tabPanel("K-Means Clustering",br(),
                     plotOutput(outputId="kmcl",width="600px",height="550px"),
                     h5("Adjust the parameters under the K-Means Clustering tab in the side bar panel. The K-Means Clustering center positions denoted by + clearly depend on intersection, numbers of points (small numbers in particular), and shapes of the distributions.")
            )
        )
    )
))
