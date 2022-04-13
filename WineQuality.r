dim(wineQualityWhites)
rows<-is.na(wineQualityWhites)
rows
sum(rows)
str(wineQualityWhites)
wineQualityWhites$score<-as.factor(wineQualityWhites$quality)
class(wineQualityWhites$score)
summary(wineQualityWhites)
#Univariate analysis using histogram
create_histogram<-function(variable){ return(ggplot(aes_string(x=variable),
                                                    data=wineQualityWhites)
                                                    +geom_histogram())}
p1<-create_histogram("fixed.acidity")
p1
p2
View(wineQualityWhites)
names(wineQualityWhites)
p3<-create_histogram("citric.acid")
p3
p4<-create_histogram("residual.sugar")
p4
p5<-create_histogram("chlorides")
p5
p6<-create_histogram("free.sulfur.dioxide")
p6
p7<-create_histogram("sulphates")
p7
p8<-create_histogram("density")
p8
p9<-create_histogram("pH")
p9
p10<-create_histogram("alcohol")
p10
p11<-create_histogram("quality")
p11
p12<-create_histogram("volatile.acidity")
p12

grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12, ncol = 3)


grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12, ncol=3)
p1<-qplot(volatile.acidity, data=wineQualityWhites, 
          geom_histogram,xlab="volatile.acidity"(g/dm^3),
          color = I("darkgoldenrod1"))+
          ggtitle("volatile acidity distribution")


p2 <- qplot(citric.acid,
            data=wineQualityWhites, 
            geom="histogram", 
            xlab = "citric.acid(g/dm^3)",
            color = I("chartreuse4")) +
  ggtitle("Citric acid distribution")

p2 + scale_x_log10() +
  scale_x_continuous(limits = c(0, 1.0), 
                     breaks = seq(0, 1.0, 0.1))
 