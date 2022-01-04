#spider packages
library(fmsb)

#import csv
ccblPUNCH <- read.csv(file.choose())


#get zscores transformed
ccblPUNCH$PUNCH <- round(pnorm(ccblPUNCH$PUNCH)*100,0)
ccblPUNCH$OPP.SLG. <- round(pnorm(ccblPUNCH$OPP.SLG.)*100,0)
ccblPUNCH$BB.9 <- round(pnorm(ccblPUNCH$BB.9)*100,0)
ccblPUNCH$Whiff. <- round(pnorm(ccblPUNCH$Whiff.)*100,0)

ccblPUNCH$TEAM <- NULL
colnames(ccblPUNCH) <- c("Player", "WhiffAbility", "WalkPreventionAbility", 
                   "DamagePreventionAbility", "PunchScore")

#ranges
max_min <- data.frame(
  WhiffAbility = c(100,0), WalkPreventionAbility = c(100,0), 
  DamagePreventionAbility = c(100,0), PunchScore = c(100,0))

#modifications for spider web
DombrowskiDF <- ccblPUNCH[ccblPUNCH$Player == "Dombrowski", ]
DombrowskiDF$Player <- NULL
DombrowskiDF <- rbind(max_min, DombrowskiDF)
rownames(DombrowskiDF) <- c("Min", "Max", "Dombrowski")

#radarchart
liteBlue <- "#39C3DB"
caxislabs <- c(" ", " ", " ", " ", " ")
vlabs <- c("Whiff Score 69", 
"BB Score 
   95    ", 
"Slugging Score 79", 
"Punch 
  100   ")

op <- par(mar = c(1, 2, 2, 1), family = "Helvetica")
radarchart(
  DombrowskiDF, axistype = 1, pcol = liteBlue, 
  pfcol = scales::alpha(liteBlue, 0.5), plwd = 3,
  plty = 1, cglcol = "#B3AC96", cglty = 1, cglwd = 2, 
  axislabcol = "#66604B", caxislabels = caxislabs, calcex = 1.3,
  vlabels = vlabs, title = "Dombroski Punch Score", palcex = 0.3, vlcex = 1.2,
  cex.main = 1.7)
par(op)

ccblPUNCH

