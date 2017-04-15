#Plot 2.R
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, sep =";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
attach(data)

#Following output display after attach(data) commands
#The following objects are masked from data (pos = 3):
#
#    Date, Global_active_power, Global_intensity, Global_reactive_power, Sub_metering_1, Sub_metering_2,
#    Sub_metering_3, Time, Voltage
# Plot the graph
plot(Global_active_power ~ datetime, type= "l", ylab = "Global Active Power (kilowatt)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width= 480)
dev.off()
detach(data)
