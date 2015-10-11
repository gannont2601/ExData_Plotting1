library(dplyr)

data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)

subsetdata <- filter(data, Date == "1/2/2007"| Date == "2/2/2007")
time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalpower <- as.numeric(subsetdata$Global_active_power)
voltage <- as.numeric(subsetdata$Voltage)
meter1 <- as.numeric(subsetdata$Sub_metering_1)
meter2 <- as.numeric(subsetdata$Sub_metering_2)
meter3 <- as.numeric(subsetdata$Sub_metering_3)
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(time, globalpower, type="l", ylab="Global Active Power", xlab = " ")

plot(time, voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(time, meter1, col = "black", type="l", ylab="Energy sub meeting", xlab = " ")
lines(time, meter2, col = "red", type = "l")
lines(time, meter3, col = "blue", type = "l")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       bty = "n", lty=c(1,1), lwd=c(2,2))

plot(time, globalreactivepower, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

