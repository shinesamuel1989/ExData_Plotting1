#Load data in R
data <- read.table("C:/Users/browntape/Documents/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset the data based on required dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Change string to date format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Change class to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
# define graphic device to be used
png("plot2.png", width=480, height=480)
# plot the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# switch off png device to view file
dev.off()