#read the data set
data <- read.table(file = "household_power_consumption.txt", header = T, sep =  
                           ";", na.strings = "?")

#convert the column Date into date class
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
#subset for values between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

#convert the column Global_active_power into numeric class
active_power <- as.numeric(data$Global_active_power)

#open the png device
png("plot2.png", 480, 480)

#plot the graph
plot(data$Date, active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n" )
lines(data$Date, active_power)

#close the device
dev.off()
