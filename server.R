# Developing Data Products Project
# James Kim
# 2017-03-15

library(shiny)
require(stats)
require(ggplot2)
shinyServer(function(input, output) {
    hypothesis<-reactive({
        data.frame(X=c(rnorm(input$g.pnts,input$g.mean,input$g.sdev),rnorm(input$p.pnts,input$p.mean,input$p.sdev)),
                   d=c(rep("g",input$g.pnts),rep("p",input$p.pnts)))
    })
    n.distr<-reactive({
        x.axis.val<-(-100:100)/10
        g.distr<-(input$g.pnts/input$g.sdev/2.75)*input$binw*exp(-((input$g.mean-x.axis.val)/input$g.sdev)^2/2)
        p.distr<-(input$p.pnts/input$p.sdev/2.75)*input$binw*exp(-((input$p.mean-x.axis.val)/input$p.sdev)^2/2)
        data.frame(X=c(x.axis.val,x.axis.val),Y=c(g.distr,p.distr),
                   d=c(rep("g",length(x.axis.val)),rep("p",length(x.axis.val))))
    })
    Ttst<-reactive({
        result<-t.test(x=hypothesis()$X[hypothesis()$d=="p"],y=hypothesis()$X[hypothesis()$d=="g"],alternative='g')
        result$p.value<=0.0005
    })
    cluster<-reactive({
        data.frame(X=c(rnorm(input$d1.pnts,input$x1.mean,input$x1.sdev),
                       rnorm(input$d2.pnts,input$x2.mean,input$x2.sdev),
                       rnorm(input$d3.pnts,input$x3.mean,input$x3.sdev),
                       rnorm(input$d4.pnts,input$x4.mean,input$x4.sdev)),
                   Y=c(rnorm(input$d1.pnts,input$y1.mean,input$y1.sdev),
                       rnorm(input$d2.pnts,input$y2.mean,input$y2.sdev),
                       rnorm(input$d3.pnts,input$y3.mean,input$y3.sdev),
                       rnorm(input$d4.pnts,input$y4.mean,input$y4.sdev)),
                   d=c(rep("1",input$d1.pnts),
                       rep("2",input$d2.pnts),
                       rep("3",input$d3.pnts),
                       rep("4",input$d4.pnts)))
    })
    k.m.centers<-reactive({
        centers<-kmeans(cluster()[,1:2],4,20)$centers
        data.frame(X=centers[,1],Y=centers[,2],d=as.character(1:4))
    })
    output$hist<-renderPlot({
        g<-ggplot(hypothesis(),aes(X,fill=d))+
            geom_histogram(position='identity',binwidth=input$binw,color='gray',alpha=0.75)+
            xlim(-10,10)+xlab("OBSERVATION")+ylab("FREQUENCY")+theme(legend.position='none')+
            geom_line(data=n.distr(),aes(x=X,y=Y,color=d),size=1.5)
        g+annotate('text',0,ggplot_build(g)$layout$panel_ranges[[1]]$y.range[2]*1.1,
                   label=ifelse(Ttst(),paste0("Null hypothesis is rejected!\n","Green distribution has a greater mean."),""))
    })
    output$kmcl<-renderPlot({
        ggplot(cluster(),aes(X,Y,color=d))+geom_point(size=2.5,alpha=0.6)+xlim(-10,10)+ylim(-10,10)+
            theme(legend.position='none')+
            geom_point(data=k.m.centers(),aes(X,Y),shape=3,color='black',size=4,alpha=1)
    })
})
