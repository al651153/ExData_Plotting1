# Getting the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
date = strptime(data$Date, format = "%d/%m/%Y")
dataSub = subset(data, date >= "2007-02-01" & date <= "2007-02-02")
dateTime = strptime(paste(dataSub$Date, dataSub$Time), format = "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(dataSub$Global_active_power)
sub_metering_1 = as.numeric(dataSub$Sub_metering_1)
sub_metering_2 = as.numeric(dataSub$Sub_metering_2)
sub_metering_3 = as.numeric(dataSub$Sub_metering_3)

# Plotting 
png("plot3.png", width = 480, height = 480)
plot(dateTime, sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(dateTime, sub_metering_2, col = "red")
lines(dateTime, sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
