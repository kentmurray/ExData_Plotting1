classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
datain <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=classes, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(datain, Date == "1/2/2007" | Date == "2/2/2007")
data <- transform(data, Date = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
rm(datain)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red", xaxp=c(0,6,3), yaxp=c(0,1200,6), xpd=TRUE)
dev.off()

rm(data)
rm(classes)
