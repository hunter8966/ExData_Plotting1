# plot2.png
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
png("plot2.png", height = 480, width = 480)

# Print time series for global active power
plot(neededDataDateTimes, neededData$Global_active_power, ylab="Global Active Power (kilowatts)", pch=NA,  xlab = "")
lines(neededDataDateTimes, neededData$Global_active_power)

# Close graphics device and store file
dev.off()