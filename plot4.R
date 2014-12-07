classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
datain <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=classes, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(datain, Date == "1/2/2007" | Date == "2/2/2007")
data <- transform(data, Date = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
rm(datain)
 
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

with(data, {
	plot(Date, Global_active_power, xlab="", ylab="Global Active Power", yaxp=c(0,8,4), type="n")
	lines(Date, Global_active_power, lwd=1)
	})
with(data, {
	plot(Date, Voltage, xlab="datetime", ylab="Voltage", yaxp=c(232,246,7), type="n")
	lines(Date, Voltage, lwd=1)
	})
with(data, {
	plot(Date, Sub_metering_1, xlab="", ylab="Energy sub metering", yaxp=c(0,40,4), type="n")
	lines(Date, Sub_metering_1, col="black", lwd=1)
	lines(Date, Sub_metering_2, col="red", lwd=1)
	lines(Date, Sub_metering_3, col="blue", lwd=1)
	})
legend("topright", lwd=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
with(data, {
	plot(Date, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", yaxp=c(0,0.9,9), type="n")
	lines(Date, Global_reactive_power, lwd=1)
	})

dev.off()
rm(data)
rm(classes)
