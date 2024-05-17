library(ggplot2)
library(RColorBrewer)
library(plotrix)
       
setwd()

load("CollectiveData.Rdata")

                                       #MEMORY
Memory <- c(AllLRPEHitRate, AllHRPEHitRate, AllOutOfSequenceHitRate, AllSingleLRPEHitRate, AllSingleHRPEHitRate)
Categories <- c("Low RPE", "High RPE", "Out Of Sequence","Single Low RPE", "Single High RPE" )
HitRatesDF <- data.frame(Categories, Memory)
SE <- std.error(Memory)
#question: different error bars for each category? Are error bars correct?

MemPlot <- ggplot(HitRatesDF, aes(x=Categories, y=Memory, fill=Categories))+
    geom_bar(stat = "identity", position=position_dodge()) + theme(legend.position = "none", legend.title = element_blank(),
      text = element_text(family = "Times"),
      plot.title = element_text(face = "bold", hjust = 0.5),
      axis.title = element_text(size=26),
      axis.text = element_text(size=16, color = "black"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      axis.line = element_line(colour = "black")
)+
    xlab("Categories") + ylab("Memory") +
    
geom_errorbar(aes(ymin=Memory-SE, ymax=Memory+SE), width=.1,
              position=position_dodge(.9))
    
    
                                    #LATENCY

Categories <- c("Low RPE", "High RPE", "Out Of Sequence","Single Low RPE", "Single High RPE" )
RT <- c(AllLRPEPrimedRTZscore, AllHRPEPrimedRTZscore,AllOutOfSequencePrimedRTZscore, AllSingleLRPEHitsRTZscore, AllSingleHRPEHitsRTZscore)    
RTmeans <- c(mean(AllLRPEPrimedRTZscore), mean(AllHRPEPrimedRTZscore),mean(AllOutOfSequencePrimedRTZscore), mean(AllSingleLRPEHitsRTZscore), mean(AllSingleHRPEHitsRTZscore))   
RT.SE <- std.error(RT) #of all RTs or the averages per category
xval <- 1:5

Latency <- plot(xval, RTmeans, xlab = "Categories", ylab="Latency", xaxt='n', ylim=c(-1,1)) 

axis(1, 1:5, labels = Categories)
  
arrows(x0=xval, y0=RTmeans-RT.SE, x1=xval, y1=RTmeans+RT.SE, code=3, angle=90,length=0.1)





