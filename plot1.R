# plot1.png
# Set to english locale
Sys.setlocale("LC_TIME", "English")

# Read all the data 
inputFileName <- "household_power_consumption.txt"
householdPowerConsumption <- fread(inputFileName, na.strings = "?")

# Select data that is either from 2007-02-01 or 2007-02-02
neededData <- householdPowerConsumption[householdPowerConsumption$Date == "1/2/2007" | householdPowerConsumption$Date == "2/2/2007",]

# Open png graphics device with name plot1.png
png("plot1.png", height = 480, width = 480)

# Print histogram for global active power
hist(as.numeric(neededData$Global_active_power), col='red', xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close graphics device and store file
dev.off()