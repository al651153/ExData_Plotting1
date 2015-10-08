# Getting the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
date = strptime(data$Date, format = "%d/%m/%Y")
dataSub = subset(data, date >= "2007-02-01" & date <= "2007-02-02")
globalActivePower <- as.numeric(dataSub$Global_active_power)

# Plotting 
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
