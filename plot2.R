classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
datain <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=classes, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(datain, Date == "1/2/2007" | Date == "2/2/2007")
data <- transform(data, Date = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
rm(datain)

png(filename = "plot2.png", width = 480, height = 480)
with(data, {
	plot(Date, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", yaxp=c(0,8,4), type="n")
	lines(Date, Global_active_power, lwd=1)
	})
dev.off()

rm(data)
rm(classes)
