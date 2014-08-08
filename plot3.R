# plot3
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
data$date.time <- as.POSIXct(date.time)

# Create plot3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data, {
        plot(Sub_metering_1 ~ date.time, type = "l",
                xlab = "", ylab="Energy sub metering")
        lines(Sub_metering_2 ~ date.time, col = "red")
        lines(Sub_metering_3 ~ date.time, col= "blue")
        })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
