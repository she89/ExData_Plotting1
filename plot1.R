setwd("C:/Users/trint/Desktop")
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
head(data)
library(dplyr)
str(data)
data2 = data %>% filter (Date == "1/2/2007" | Date == "2/2/2007")
data2$Date = as.Date(data2$Date, format="%d/%m/%Y")
hist(data2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
