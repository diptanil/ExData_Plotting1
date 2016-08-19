# Read in the table
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date field as a Date class
hpc$Date <- dmy(hpc$Date)
lo <- hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02")

# Subset the data as required
hpc_data <- subset(hpc, lo)

# Open a png graphic device
png(filename = "plot1.png", height = 480, width = 480)

# Plot the graph
hist(hpc_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close the device
dev.off()