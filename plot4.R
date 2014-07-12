n = 2075259
mydata <- read.table(pipe('grep "^[1-2]/2/2007" "./household_power_consumption.txt"'), sep=";",
                     header=FALSE, quote="", stringsAsFactors=FALSE, comment.char="",
                     nrows=n, skipNul=TRUE, 
                     na.strings = c("?"),
                     colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(mydata) <-names(read.table('./household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")

par(mfrow=c(2,2))

plot(mydata$DateTime, mydata$Global_active_power, ylab="Global Active Power", xlab="", type="l")

plot(mydata$DateTime, mydata$Voltage, ylab="Voltage", xlab="datetime", type="l")

with(mydata, plot(DateTime, Sub_metering_1, type="n",xlab="", ylab=""))
with(mydata, lines(DateTime, Sub_metering_1, type="l", col="black"))
with(mydata, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(mydata, lines(DateTime, Sub_metering_3, type="l", col="blue"))
title(ylab="Energy sub metering", xlab="")
legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(mydata$DateTime, mydata$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()