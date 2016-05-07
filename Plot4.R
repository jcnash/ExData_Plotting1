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


## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(hepart, {
        plot(hepart$Global_active_power~hepart$dateconv, type="l", xlab="", 
             ylab="Global Active Power (kilowatts)")
        plot(hepart$Voltage~hepart$dateconv, type="l", xlab="datetime", 
             ylab="Voltage")
        plot(hepart$Sub_metering_1~hepart$dateconv, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(hepart$Sub_metering_2~hepart$dateconv,col='Red')
        lines(hepart$Sub_metering_3~hepart$dateconv,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(hepart$Global_reactive_power~hepart$dateconv, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()