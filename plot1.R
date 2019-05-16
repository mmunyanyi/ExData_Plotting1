
sourceDataFile <- "C:/DataScience/ExDataAssignment1/household_power_consumption.txt"
data <- read.table(sourceDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
trimData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(trimData)
globalActivePower <- as.numeric(trimData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
