#Load data in R
data <- read.table("C:/Users/browntape/Documents/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset the data based on required dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Change string to date format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Change class to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# define graphic device to be used
png("plot3.png", width=480, height=480)
# plot the data
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# switch off png device to view file
dev.off()
