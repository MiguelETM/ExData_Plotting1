#read the data set
data <- read.table(file = "household_power_consumption.txt", header = T, sep =  
                           ";", na.strings = "?")

#convert the column Date into date class
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
#subset for values between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

#convert the columns into numeric class
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)
#open the png device
png("plot3.png", 480, 480)

#plot the graph
plot(data$Date, sub1, ylab = "Energy sub metering", xlab = "", type = "n" )
lines(data$Date, sub1, col = "black")
lines(data$Date, sub2, col = "red")
lines(data$Date, sub3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#close the device
dev.off()