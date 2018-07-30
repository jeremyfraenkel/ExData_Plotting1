download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","UC.zip")
unzip("UC.ZIP")
data <- read.table("household_power_consumption.txt",na.strings = "?",header=T,sep = ";")
data <- data[grep("\\b1/2/2007\\b|\\b2/2/2007\\b",data$Date),]

png(file = "plot2.png")

DateTime <- paste(data$Date,data$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")

plot(DateTime,data$Global_active_power,type="l", ylab= "Global Active Power (killowatts)", xlab ="")

dev.off()