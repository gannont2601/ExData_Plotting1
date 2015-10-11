library(dplyr)

data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)

subsetdata <- filter(data, Date == "1/2/2007"| Date == "2/2/2007")
time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalpower <- as.numeric(subsetdata$Global_active_power)

png("plot2.png", width=480, height=480)
plot(time, globalpower, type="l", ylab="Global Active Power (kilowatts)", xlab = " ")
dev.off()
