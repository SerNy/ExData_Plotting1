data_set <- "household_power_consumption.txt"
data_f <- read.table(data_set, header=TRUE, sep=";", stringsAsFactors = FALSE, dec="." )

data_f$Date <- as.Date(data_f$Date,  format="%d/%m/%Y")

dataExtract <- subset(data_f, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataExtract$Date),dataExtract$Time)
datetime <- as.POSIXct(datetime)

activePower <- as.numeric(dataExtract$Global_active_power)
subMeter1 <- as.numeric(dataExtract$Sub_metering_1)
subMeter2 <- as.numeric(dataExtract$Sub_metering_2)
subMeter3 <- as.numeric(dataExtract$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, subMeter1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, subMeter2, type="l", col="red") 
lines(datetime, subMeter3, type="l", col="blue") 

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()