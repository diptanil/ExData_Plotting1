hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hpc$datetime <- paste(hpc$Date, hpc$Time)
hpc$Date <- dmy(hpc$Date)
lo <- hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02")
hpc_data <- subset(hpc, lo)
hpc_data$datetime <- dmy_hms(hpc_data$datetime)
png(filename = "plot3.png", height = 480, width = 480)
plot(hpc_data$datetime, hpc_data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(hpc_data$datetime, hpc_data$Sub_metering_1, type = "o", pch = ".", col = "black")
points(hpc_data$datetime, hpc_data$Sub_metering_2, type = "o", pch = ".", col = "red")
points(hpc_data$datetime, hpc_data$Sub_metering_3, type = "o", pch = ".", col = "blue")
legend("topright", pch = c("-", "-", "-"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()