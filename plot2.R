setwd("C:/Users/trint/Desktop")
data = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
head(data)
library(dplyr)
str(data)
data2 = data %>% filter (Date == "1/2/2007" | Date == "2/2/2007")
data2$Date = as.Date(data2$Date, format="%d/%m/%Y")
data2$Datetime <- as.POSIXct(paste(as.Date(data2$Date), data2$Time))

## Plot 2
with(data2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()