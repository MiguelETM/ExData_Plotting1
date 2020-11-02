#read the data set
data <- read.table(file = "household_power_consumption.txt", header = T, sep =  
                           ";", na.strings = "?")

#convert the column Date into date class
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
#subset for values between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

#convert the columns numeric class
active_power <- as.numeric(data$Global_active_power)
reactive_power <- as.numeric(data$Global_reactive_power) 
volt <- as.numeric(data$Voltage)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

#open the png device
png("plot4.png", 480, 480)
par(mfrow = c(2,2))
#plot topleft
plot(data$Date, active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n" )
lines(data$Date, active_power)
#plot topright
plot(data$Date, volt, ylab = "Voltage", xlab = "datetime", type = "n" )
lines(data$Date, volt)
#plot bottomleft
plot(data$Date, sub1, ylab = "Energy sub metering", xlab = "", type = "n" )
lines(data$Date, sub1, col = "black")
lines(data$Date, sub2, col = "red")
lines(data$Date, sub3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot bottomright
plot(data$Date, reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n" )
lines(data$Date, reactive_power)

#close the device
dev.off()