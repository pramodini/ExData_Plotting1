

data <- read.csv("./exploratorydataanalysis/household_power_consumption.txt",
                     header = T, na.strings = "?",sep=';',nrows=2075259,check.names=F,stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

pdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)

date_time <- paste(as.Date(pdata$Date), pdata$Time)

pdata$DateTime <- as.POSIXct(date_time)

plot(pdata$Global_active_power ~ pdata$DateTime,
     xlab="", ylab="Global Active Power (kilowatts)",type = "l")


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()