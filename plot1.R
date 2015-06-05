

data <- read.csv("./exploratorydataanalysis/household_power_consumption.txt",
                     header = T, na.strings = "?",sep=';',nrows=2075259,check.names=F,stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

pdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)

date_time <- paste(as.Date(pdata$Date), pdata$Time)

pdata$DateTime <- as.POSIXct(date_time)

hist(pdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()