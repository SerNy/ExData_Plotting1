data_set <- "household_power_consumption.txt"
data_f <- read.table(data_set, header=TRUE, sep=";", stringsAsFactors = FALSE, dec="." )

data_f$Date <- as.Date(data_f$Date,  format="%d/%m/%Y")

dataExtract <- subset(data_f, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataExtract$Date),dataExtract$Time)
datetime <- as.POSIXct(datetime)

activePower <- as.numeric(dataExtract$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(datetime, activePower, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)")
dev.off()



        