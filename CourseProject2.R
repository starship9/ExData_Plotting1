NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(NEI)
str(NEI)
summary(SCC)
str(SCC)

names(NEI)
#with(NEI,plot(year,Emissions))
class(NEI$year)
#plot1 begins
NEI$year <- as.factor(NEI$year)
names(tapply(NEI$Emissions,NEI$year,sum))
xnames <- names(tapply(NEI$Emissions,NEI$year,sum))
plot(tapply(NEI$Emissions,NEI$year,sum),xaxt = "n",main = "Total Pollution per Year",xlab = "Year", ylab = "Pollution",pch = 19)
axis(1,at = 1:length(xnames),labels = xnames)
#plot1 ends

#plot2 begins
baltimore <- subset(NEI,fips == 24510)
names(baltimore)
xBaltinames <- names(tapply(baltimore$Emissions,baltimore$year,sum))
plot(tapply(baltimore$Emissions,baltimore$year,sum),xaxt = "n",main = "Total Pollution per Year in Baltimore",xlab = "Year", ylab = "Pollution",pch = 19)
axis(1,at = 1:length(xnames),labels = xBaltinames)
#plot2 ends

#plot3 begins
library(ggplot2)
g <- ggplot(data = baltimore,mapping = aes(year,Emissions)) + geom_col(aes(fill = type,alpha = 0.5)) + ggtitle("Pollution in Baltimore City")
g
#plot3 ends

#plot4 begins
coalDF <- SCC[grep("Coal",SCC$Short.Name),]
coalIntersect <- intersect(coalDF$SCC,NEI$SCC)
class(coalIntersect)
head(coalIntersect)
#dim(coalIntersect)
length(coalIntersect)

#coalAggDF <- aggregate(NEI$SCC[NEI$SCC %in% coalIntersect,],NEI$year,sum)
coalAggDef <- subset(NEI,SCC==coalIntersect)
class(coalAggDef$year)
names(tapply(coalAggDef$Emissions,coalAggDef$year,sum))
xnames <- names(tapply(coalAggDef$Emissions,coalAggDef$year,sum))
plot(tapply(coalAggDef$Emissions,coalAggDef$year,sum),xaxt = "n",main = "Total Pollution per Year from Coal-related sources",xlab = "Year", ylab = "Pollution",pch = 19)
axis(1,at = 1:length(xnames),labels = xnames)
#plot4 ends

#plot5 begins
baltimoreDF <- SCC[grep("Motor",SCC$Short.Name),]
baltimoreIntersect <- intersect(baltimoreDF$SCC,baltimore$SCC)
length(baltimoreIntersect)
baltimoreAggDF <- subset(baltimoreDF,SCC == baltimoreIntersect)
names(tapply(baltimoreAggDF$Emissions,baltimoreAggDF$year,sum))
xnames <- names(tapply(baltimoreAggDF$Emissions,baltimoreAggDF$year,sum))
plot(tapply(baltimoreAggDF$Emissions,baltimoreAggDF$year,sum),xaxt = "n",main = "Total Pollution per Year from Motor vehicles in Baltimore City",xlab = "Year", ylab = "Pollution",pch = 19)
axis(1,at = 1:length(xnames),labels = xnames)

#plot5 ends