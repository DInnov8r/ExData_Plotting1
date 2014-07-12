n = 2075259
mydata <- read.table(pipe('grep "^[1-2]/2/2007" "./household_power_consumption.txt"'), sep=";",
                     header=FALSE, quote="", stringsAsFactors=FALSE, comment.char="",
                     nrows=n, skipNul=TRUE, 
                     na.strings = c("?"),
                     colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(mydata) <-names(read.table('./household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png")
plot(mydata$DateTime, mydata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
