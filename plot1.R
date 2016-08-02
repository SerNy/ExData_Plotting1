data_set <- "household_power_consumption.txt"
data_f <- read.table(data_set, header=TRUE, sep=";", stringsAsFactors = FALSE, dec="." )
dataExtract <- data_f[data_f$Date %in% c("1/2/2007","2/2/2007"), ]

activePower <- as.numeric(dataExtract$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(activePower, col = "red", main="Global Active Power", xlab = "Global Active Power(Kilowatts)")
dev.off()