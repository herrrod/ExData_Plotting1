library(lubridate)

# Large dataset takes a while to load
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert Date, filter then convert Time
data$Date <- dmy(data$Date)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$Time <- data$Date + hms(data$Time)

# Plot
png("plot4.png")

par(mfrow = c(2, 2))
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering") 
lines(data$Time, data$Sub_metering_2, type="l", col="red") 
lines(data$Time, data$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", col=c("black", "red", "blue"), lty=1)
plot(data$Time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()