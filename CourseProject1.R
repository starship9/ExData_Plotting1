library(readr)
household_power_consumption <- read_delim("C:/Users/Nishank/Desktop/SNU/RStuff/CourseraEDA/household_power_consumption.txt",
";", escape_double = FALSE, trim_ws = TRUE)
str(household_power_consumption)
summary(household_power_consumption)
dim(household_power_consumption)
class(household_power_consumption$Date)

library(tidyverse)
head(household_power_consumption$Date)
tail(household_power_consumption$Date)
household_power_consumption$Date <- lubridate::dmy(household_power_consumption$Date)
class(household_power_consumption$Date)
head(household_power_consumption$Date)
subsetData <- filter(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02")
dim(subsetData)
summary(subsetData)
str(subsetData)

names(subsetData)
plot(subsetData$Sub_metering_1,subsetData$Global_reactive_power)
plot(subsetData$Sub_metering_1,subsetData$Global_active_power)
plot(subsetData$Sub_metering_1,subsetData$Global_intensity)
hist(subsetData$Global_active_power,col="red",breaks = 11,xlab = "Global Active Power (kilowatts)")

plot(subsetData$Sub_metering_1,subsetData$Global_active_power,type = "l",xlab = "")
lines(subsetData$Sub_metering_2,subsetData$Global_active_power,col = "red")
lines(subsetData$Sub_metering_3,subsetData$Global_active_power,col = "blue")
names(subsetData)

plot(subsetData$Date,subsetData$Sub_metering_1,type = "b",xlab = "")
lines(subsetData$Date,subsetData$Sub_metering_2,col = "red")
lines(subsetData$Date,subsetData$Sub_metering_3,col = "blue")

