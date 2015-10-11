library(dplyr)

data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)

subsetdata <- filter(data, Date == "1/2/2007"| Date == "2/2/2007")
power <- as.numeric(subsetdata$Global_active_power)

png("plot1.png", height = 480, width = 480)
hist(power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
