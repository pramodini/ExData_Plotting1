data <- read.csv("./exploratorydataanalysis/household_power_consumption.txt",
                     header = T, na.strings = "?",sep=';',nrows=2075259,check.names=F,stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

pdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)

date_time <- paste(as.Date(pdata$Date), pdata$Time)

pdata$DateTime <- as.POSIXct(date_time)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(pdata,{

plot(Global_active_power ~ DateTime, type = "l",
      ylab="Global Active Power ", xlab="")

plot(Voltage ~ DateTime, type = "l", ylab="Voltage", xlab="datetime")

plot(Sub_metering_1 ~ DateTime,type = "l",ylab="Energy sub metering",xlab="")
    lines(Sub_metering_2 ~ DateTime, col="red")
    lines(Sub_metering_3 ~ DateTime, col="blue")

 legend("topright", col=c("black","red","blue"),lty=1,lwd=2,
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
plot(Global_reactive_power ~ DateTime, type="l",ylab="Global_reactive_power",
     xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()