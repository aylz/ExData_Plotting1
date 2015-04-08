library(lubridate)
library(dplyr)

fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="data_file.zip")
unzip(zipfile="data_file.zip")

raw_data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.string="?") 
data <- raw_data[raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007",]
data <- mutate(data, datetime=dmy(Date)+hms(Time))

#plot 4
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2), cex=.6)
with(data, {
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type="l", ylab="Voltage")
  plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
  plot(datetime, Global_reactive_power, type="l")
})
dev.off()
