sourceDataFile <- "C:/DataScience/ExDataAssignment1/household_power_consumption.txt"
data <- read.table(sourceDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Triming data to only required dataset
trimData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert text to date
datetime <- strptime(paste(trimData$Date, trimData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert text to numeric
globalActivePower <- as.numeric(trimData$Global_active_power)
globalReactivePower <- as.numeric(trimData$Global_reactive_power)
voltage <- as.numeric(trimData$Voltage)
subMetering1 <- as.numeric(trimData$Sub_metering_1)
subMetering2 <- as.numeric(trimData$Sub_metering_2)
subMetering3 <- as.numeric(trimData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()