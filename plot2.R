# Getting the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
date = strptime(data$Date, format = "%d/%m/%Y")
dataSub = subset(data, date >= "2007-02-01" & date <= "2007-02-02")
dateTime = strptime(paste(dataSub$Date, dataSub$Time), format = "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(dataSub$Global_active_power)

# Plotting 
png("plot2.png", width = 480, height = 480)
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
