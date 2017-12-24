library(readr)
#reading data from file
powerConsumption<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")

dateIndex<-as.Date(mydata$Date,"%d/%m/%Y") %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y"))
subsetData<-mydata[dateIndex,]
str(subsetData)
write.csv(subsetData,"subsetData.csv")
