library(lubridate)
library(dplyr)

fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="data_file.zip")
unzip(zipfile="data_file.zip")

raw_data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.string="?") 
data <- raw_data[raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007",]
data <- mutate(data, datetime=dmy(Date)+hms(Time))

#plot 1
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
