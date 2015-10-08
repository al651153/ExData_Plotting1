# Getting the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
date = strptime(data$Date, format = "%d/%m/%Y")
dataSub = subset(data, date >= "2007-02-01" & date <= "2007-02-02")
dateTime = strptime(paste(dataSub$Date, dataSub$Time), format = "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(dataSub$Global_active_power)
voltage = as.numeric(dataSub$Voltage)
sub_metering_1 = as.numeric(dataSub$Sub_metering_1)
sub_metering_2 = as.numeric(dataSub$Sub_metering_2)
sub_metering_3 = as.numeric(dataSub$Sub_metering_3)
globalReactivePower = as.numeric(dataSub$Global_reactive_power)

# Plotting 
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# First plot
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab="Global Active Power")

# Second plot
plot(dateTime, voltage, type = "l", xlab = "datetime", ylab="Voltage")

# Third plot
plot(dateTime, sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(dateTime, sub_metering_2, col = "red")
lines(dateTime, sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# Fourth plot
plot(dateTime, globalReactivePower, type = "l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()
