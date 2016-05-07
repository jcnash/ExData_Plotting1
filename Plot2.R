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

## Plot 2
plot(hepart$Global_active_power~hepart$dateconv, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()
