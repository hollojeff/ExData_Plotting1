data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007")]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submeter1 <- as.numeric(subSetData[,"Sub_metering_1"])
submeter2 <- as.numeric(subSetData[,"Sub_metering_2"])  
submeter3 <- as.numeric(subSetData[,"Sub_metering_3"])  
png(filename ="rplot3.png", width = 480, height = 480)
plot(datetime, submeter1, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime,submeter2, type = "l", col = "Red" )
points(datetime,submeter3, type = "l", col = "Blue" )
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
dev.off()