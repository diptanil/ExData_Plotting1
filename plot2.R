# Read in the table
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Create a new Date-Time field
hpc$datetime <- paste(hpc$Date, hpc$Time)

# Convert the Date field as a Date class
hpc$Date <- dmy(hpc$Date)
lo <- hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02")

# Subset the data as required
hpc_data <- subset(hpc, lo)

# Convert the datetime field as a Time class
hpc_data$datetime <- dmy_hms(hpc_data$datetime)

# Open a png graphic device
png(filename = "plot2.png", height = 480, width = 480)

# Plot the graph
with(hpc_data, plot(datetime, Global_active_power, type = "o", pch = ".", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Close the device
dev.off()