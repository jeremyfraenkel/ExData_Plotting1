download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","UC.zip")
unzip("UC.ZIP")
data <- read.table("household_power_consumption.txt",na.strings = "?",header=T,sep = ";")
data <- data[grep("\\b1/2/2007\\b|\\b2/2/2007\\b",data$Date),]

png(file = "plot1.png")

hist(data$Global_active_power,col="red", main = "Global Active Power", xlab= "Global Active Power (killowatts)", ylab= "Frequency")

dev.off()