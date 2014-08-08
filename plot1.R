# Plot 1
# Data Source: http://archive.ics.uci.edu/ml/
# Data download: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data for dates 02/01/2007 to 02/02/2001
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   skip = 66636, nrows = 2880)
names(data) <- c("Date", "Time", "Global_active_power", 
                 "Global_reactive_power", "Voltage", "Global_intensity", 
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Create the appropriate time axis using as.Date and as.POSIXct
date.time <- paste(as.Date(data$Date), data$Time)
data$date <- as.POSIXct(date.time)

# Create plot1
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save plot1 to file 'plot1.png'
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
