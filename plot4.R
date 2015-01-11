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
png("plot4.png", height = 480, width = 480)

# Open multiplot
par(mfrow=c(2,2))

# Print time series for global active power
plot(neededDataDateTimes, neededData$Global_active_power, ylab="Global Active Power (kilowatts)", pch=NA,  xlab = "")
lines(neededDataDateTimes, neededData$Global_active_power)

# Print time series for voltage
plot(neededDataDateTimes, neededData$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(neededDataDateTimes, neededData$Voltage)

# Print time series for energy sub metering
plot(neededDataDateTimes, neededData$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(neededDataDateTimes, neededData$Sub_metering_1, col="black")
lines(neededDataDateTimes, neededData$Sub_metering_2, col="red")
lines(neededDataDateTimes, neededData$Sub_metering_3, col="blue")
legend('topright',col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))

# Print time series for global reactive power
plot(neededDataDateTimes, neededData$Global_reactive_power, pch=NA, xlab="", ylab="Global_reactive_power")
lines(neededDataDateTimes, neededData$Global_reactive_power)

# Close graphics device and store file
dev.off()