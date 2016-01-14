#Load data in R
data <- read.table("C:/Users/browntape/Documents/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset the data based on required dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Change class to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
# define graphic device to be used
png("plot1.png", width=480, height=480)
# plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# switch off png device to view file
dev.off()
