n = 2075259
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
mydata <- read.table(pipe('grep "^[1-2]/2/2007" "./household_power_consumption.txt"'), sep=";",
                     header=FALSE, quote="", stringsAsFactors=FALSE, comment.char="",
                     nrows=n, skipNul=TRUE, 
                     na.strings = c("?"),
                     colClasses=c("myDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(mydata) <-names(read.table('./household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

png(filename="plot1.png")
hist(mydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
