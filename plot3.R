setwd("C:/Users/trint/Desktop")
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
head(data)
library(dplyr)
str(data)
data2 = data %>% filter (Date == "1/2/2007" | Date == "2/2/2007")
data2$Date = as.Date(data2$Date, format="%d/%m/%Y")
data2$Datetime <- as.POSIXct(paste(as.Date(data2$Date), data2$Time))

with(data2, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()