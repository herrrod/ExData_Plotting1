library(lubridate)

# Large dataset takes a while to load
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert Date, filter then convert Time
data$Date <- dmy(data$Date)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$Time <- data$Date + hms(data$Time)

# Plot
png("plot1.png")
hist(data$Global_active_power, col="red", axes=FALSE, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
axis(1) # yes, we want x axis
axis(2, at=seq(0, 1200, by = 200)) # yes we want y axis with specific points
dev.off()
