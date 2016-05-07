## Set working directory
setwd("/Users/JCN/Desktop/Coursera/4 Exploratory Data Analysis")

## download data
hefull <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", nrows=2075259, 
                 check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hefull$Date <- as.Date(hefull$Date, format="%d/%m/%Y")

## Select relevant data based 
hepart <- subset(hefull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hefull)

## Convert date format
dateconv <- paste(as.Date(hepart$Date), hepart$Time)
hepart$dateconv <- as.POSIXct(dateconv)

## Plot 3
with(hepart, {
        plot(Sub_metering_1~dateconv, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~dateconv,col='Red')
        lines(Sub_metering_3~dateconv,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
