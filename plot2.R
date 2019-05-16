sourceDataFile <- "C:/DataScience/ExDataAssignment1/household_power_consumption.txt"
data <- read.table(sourceDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
trimData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert text to date
datetime <- strptime(paste(trimData$Date, trimData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert text to numeric
globalActivePower <- as.numeric(trimData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

