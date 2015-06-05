

data <- read.csv("./exploratorydataanalysis/household_power_consumption.txt",
                     header = T, na.strings = "?",sep=';',nrows=2075259,check.names=F,stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

pdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)

date_time <- paste(as.Date(pdata$Date), pdata$Time)

pdata$DateTime <- as.POSIXct(date_time)
##str(pdata)
with( pdata, {plot(Sub_metering_1 ~ DateTime,
    xlab="", ylab="Energy sub metering",type = "l")
    lines(Sub_metering_2 ~ DateTime, col = "red")
    lines(Sub_metering_3 ~ DateTime, col = "blue")
})
 legend("topright", col = c("black","red","blue"),lty = 1,lwd =2,
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()