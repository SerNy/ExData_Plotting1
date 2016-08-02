data_set <- "household_power_consumption.txt"
data_f <- read.table(data_set, header=TRUE, sep=";", stringsAsFactors = FALSE, dec="." )


data_f$Date <- as.Date(data_f$Date,  format="%d/%m/%Y")
dataExtract <- subset(data_f, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataExtract$Date),dataExtract$Time)
datetime <- as.POSIXct(datetime)

activePower <- as.numeric(dataExtract$Global_active_power)
reactivePower <- as.numeric(dataExtract$Global_reactive_power)
voltage <- as.numeric(dataExtract$Voltage)

subMeter1 <- as.numeric(dataExtract$Sub_metering_1)
subMeter2 <- as.numeric(dataExtract$Sub_metering_2)
subMeter3 <- as.numeric(dataExtract$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))#All plots on one page

plot(datetime, activePower, type = "l", xlab = "", ylab = "Global_reactive_power", cex = 0.2)
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, subMeter1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, subMeter2, type="l", col="red") 
lines(datetime, subMeter3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =, lwd = 2.5, col = c("black", "red", "blue"), bty = "0")
plot(datetime, reactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()