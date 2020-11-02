
#read the data set
data <- read.table(file = "household_power_consumption.txt", header = T, sep =  
                           ";", na.strings = "?")

#convert the column Date into date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset for values between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#convert the column Global_active_power into numeric class
active_power <- as.numeric(data$Global_active_power)

#open the png device
png("plot1.png", 480, 480)

#plot the histogram
hist(active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"
                        , main ="Global Active Power " )

#close the device
dev.off()