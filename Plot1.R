# Plot 1 - Plot the histogram Global Active Power
# clean up the history data
rm(list = ls())

# Read the data into the table
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date <- as.Data(data$Date, format = "%d/%m/%Y")

# subset the data based on the criteria
data <- subset(data, subset = (Date > "2007-02-01" & Date <= "2007-02-02"))
attach(data)

# Plot the histogram using the hist 
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowattes)", col= "Red")
dev.copy(png, file = "plot1.png", height = 480, width=480)
dev.off()
detach(data)
