# Developing Data Products Project
# James Kim
# 2017-03-15

library(shiny)
shinyUI(fluidPage(
    br(),
    mainPanel(width=10,
        tabsetPanel(
            tabPanel(h4(strong("Normally Exploring ...")),
                     h3(strong("Explore statistical properties of the normal distribution!")),
                     br(),
                     h3("Hypothesis Testing"),
                     h5("Choose the ",strong("Hypothesis Testing")," tab to manipulate two normal distribution samples and see the results of Student's (Gosset's) T-testing on them. The null hypothesis for the testing is that the mean of the pink distribution sample is greater than or equal to the mean of the green distribution sample."),
                     h5("Distribution sample is selectable by choosing the",strong("Green")," or ",strong("Pink")," tab."),
                     h5("For each distribution sample, Number of Points (sample size), Mean, and Standard Deviation are adjustable parameters."),
                     h5("For the histogram plot, Binning Width can be adjusted."),
                     br(),
                     h3("K-Means Clustering"),
                     h5("Choose the ",strong("K-Means Clustering")," tab to manipulate four two-dimensional normal distribution samples and see the results of K-Means Clustering on them."),
                     h5("Distribution is selectable by choosing the ",strong("Red"),", ",strong("Green"),", ",strong("Blue"),", or ",strong("Purple")," tab."),
                     h5("For each distribution, Number of Points (sample size), Mean, and Standard Deviation are adjustable parameters."),
                     br(),
                     h5("Panels in this Shiny App are well layed out in a Chrome browser page on a 15-inch Macbook Pro."),
                     h6("The Normally Exploring ... App is designed and written by James Kim, March 15, 2017.")
            ),
            tabPanel(h4(strong("Hypothesis Thesting")),
                     br(),
                     sidebarPanel(width=4,
                            sliderInput(inputId="binw",label=h6("Binning Width"),0.1,1,0.1,0.1),
                            tabsetPanel(
                            tabPanel(h5(strong("Green")),
                                br(),
                                sliderInput(inputId="p.pnts",label=h6("Number of Points"),0,100,100,5),
                                sliderInput(inputId="p.mean",label=h6("Mean"),-5,5,0,0.01),
                                sliderInput(inputId="p.sdev",label=h6("Standard Deviation"),1,2.5,1,0.01)
                            ),
                            tabPanel(h5(strong("Pink")),
                                br(),
                                sliderInput(inputId="g.pnts",label=h6("Number of Points"),0,100,100,5),
                                sliderInput(inputId="g.mean",label=h6("Mean"),-5,5,0,0.01),
                                sliderInput(inputId="g.sdev",label=h6("Standard Deviation"),1,2.5,1,0.01)
                            )
                        )
                    ),
                    mainPanel(width=8,
                        plotOutput(outputId="hist",width="700px",height="400px"),
                        h5("Adjust the parameters in the side bar panel. Hypothesis testing depends on intersection and number of points (sample size)."),
                        h5("Student's T-test is performed on the two normal distribution samples for which the null hypothesis is that the mean of the pink distribution sample is greater than or equal to the mean of the green distribution sample. If the 95% Confidence-Interval T-test is passed, then the null hypothesis is rejected, i.e. the mean of the green distribution sample is greater than the mean of the pink distribution sample. For large number of points, it is remarkable how close the distribution samples can be, with the hypothesis rejected. On the other hand, for small number of points (for which the T-distribution is appropriate), rejection of the null hypothesis is more sporadic near the threshold, as expected.")
                    )
            ),
            tabPanel(h4(strong("K-Means Clustering")),
                     br(),
                     sidebarPanel(width=4,
                            tabsetPanel(
                                tabPanel(h5(strong("Red")),
                                    br(),
                                    sliderInput(inputId="d1.pnts",label=h6("Number of Points"),0,100,100,10),
                                    sliderInput(inputId="x1.mean",label=h6("X-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="x1.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01),
                                    sliderInput(inputId="y1.mean",label=h6("Y-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="y1.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01)
                                ),
                                tabPanel(h5(strong("Green")),
                                    br(),
                                    sliderInput(inputId="d2.pnts",label=h6("Number of Points"),0,100,100,10),
                                    sliderInput(inputId="x2.mean",label=h6("X-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="x2.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01),
                                    sliderInput(inputId="y2.mean",label=h6("Y-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="y2.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01)
                                ),
                                tabPanel(h5(strong("Blue")),
                                    br(),
                                    sliderInput(inputId="d3.pnts",label=h6("Number of Points"),0,100,100,10),
                                    sliderInput(inputId="x3.mean",label=h6("X-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="x3.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01),
                                    sliderInput(inputId="y3.mean",label=h6("Y-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="y3.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01)
                                ),
                                tabPanel(h5(strong("Purple")),
                                    br(),
                                    sliderInput(inputId="d4.pnts",label=h6("Number of Points"),0,100,100,10),
                                    sliderInput(inputId="x4.mean",label=h6("X-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="x4.sdev",label=h6("X-Standard Deviation"),1,3,1,0.01),
                                    sliderInput(inputId="y4.mean",label=h6("Y-Mean"),-5,5,0,0.01),
                                    sliderInput(inputId="y4.sdev",label=h6("Y-Standard Deviation"),1,3,1,0.01)
                                )
                            )
                     ),
                     mainPanel(width=7,
                     plotOutput(outputId="kmcl",width="600px",height="600px"),
                     h5("Adjust the parameters in the side bar panel. The K-Means Clustering center positions denoted by + depend on intersection, numbers of points (sample size), and shapes of the distributions.")
                     )
                )
            )
        )
    )
)
