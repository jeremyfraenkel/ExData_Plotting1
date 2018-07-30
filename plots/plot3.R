download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","UC.zip")
unzip("UC.ZIP")
data <- read.table("household_power_consumption.txt",na.strings = "?",header=T,sep = ";")
data <- data[grep("\\b1/2/2007\\b|\\b2/2/2007\\b",data$Date),]

png(file = "plot3.png")

DateTime <- paste(data$Date,data$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")

plot(DateTime, data$Sub_metering_1, type="n", ylab= "Energy sub metering", xlab ="")
lines(DateTime, data$Sub_metering_1, col = "black")
lines(DateTime, data$Sub_metering_2, col = "red")
lines(DateTime, data$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1)

dev.off()