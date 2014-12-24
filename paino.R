library("ggplot2")
library("GGally")
library("MASS")
library("mgcv")
library("car")
library("scatterplot3d")

path <- "/Users/jaakkos/Documents/omat/"
Data <- read.csv(file=paste0(path,"paino.csv"),head=TRUE,sep=";")

Data$pvm.2 <- as.Date(Data$pvm, format="%Y-%m-%d")
#dev.new()
ggplot(Data, aes(x=pvm.2,y=paino)) + geom_point(shape=1) + geom_smooth(method="rlm",fullrange=TRUE) + 
  xlim(Data$pvm.2[1],as.Date("2014-12-31", format="%Y-%m-%d"))
ggsave(paste0(path,"paino.png"))

#dev.new()
ggplot(Data, aes(x=pvm.2,y=paino)) + geom_point(shape=1)+ geom_smooth(method="gam", formula = y ~ s(x), fullrange=TRUE) + 
  xlim(Data$pvm.2[1],as.Date("2014-12-31", format="%Y-%m-%d"))
ggsave(paste0(path,"paino_s.png"))


