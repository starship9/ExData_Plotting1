subsetData <- read.csv("subsetData.csv",stringsAsFactors = FALSE)
str(subsetData)
png(file = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(as.numeric(subsetData$Global_active_power),main ="",type="l", ylab="Global Active Power",xlab="",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')

plot(as.numeric(subsetData$Voltage),main="",type="l", ylab="Voltage",xlab="datetime",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(234,238,240,242,246),labels=c("234","238","240","242","246"))
box(lty = 1, col = 'black')

plot(1:nrow(subsetData),as.numeric(subsetData$Sub_metering_1),main="", ylab="Energy sub metering",xlab="",type="l",col="black",axes=FALSE)

lines(as.numeric(subsetData$Sub_metering_2),col="red",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
lines(as.numeric(subsetData$Sub_metering_3),col="blue",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=1)
box(lty = 1, col = 'black')

plot(as.numeric(subsetData$Global_reactive_power),main ="",type="l", ylab="",xlab="datetime",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0.1,0.2,0.3,0.4,0.5),c("0.1","0.2","0.3","0.4","0.5"))
box(lty = 1, col = 'black')

dev.off()
