library(lubridate)

# Large dataset takes a while to load
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert Date, filter then convert Time
data$Date <- dmy(data$Date)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$Time <- data$Date + hms(data$Time)

# Plot
png("plot2.png")
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()