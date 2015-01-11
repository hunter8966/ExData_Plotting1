# plot3.png
# Set to english locale
Sys.setlocale("LC_TIME", "English")

# Read all the data 
inputFileName <- "household_power_consumption.txt"
householdPowerConsumption <- fread(inputFileName, na.strings = "?")

# Select data that is either from 2007-02-01 or 2007-02-02
neededData <- householdPowerConsumption[householdPowerConsumption$Date == "1/2/2007" | householdPowerConsumption$Date == "2/2/2007",]

# Get datetimes
neededDataDateTimes <- strptime(paste(neededData$Date, neededData$Time), "%d/%m/%Y %H:%M:%S")

# Open png graphics device with name plot2.png
png("plot3.png", height = 480, width = 480)

# Print time series for energy sub metering
plot(neededDataDateTimes, neededData$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(neededDataDateTimes, neededData$Sub_metering_1, col="black")
lines(neededDataDateTimes, neededData$Sub_metering_2, col="red")
lines(neededDataDateTimes, neededData$Sub_metering_3, col="blue")
legend('topright',col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))

# Close graphics device and store file
dev.off()