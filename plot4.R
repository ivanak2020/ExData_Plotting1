library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",  sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",     header = TRUE, sep = ";")
png(file="plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Global_active_power, xlab="",ylab= "Global Active Power (kilowatts)",type="n")
lines(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Global_active_power)

plot(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Voltage, xlab="datetime",ylab= "Voltage",type="n")
lines(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Voltage)

plot(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Sub_metering_1, xlab="",ylab= "Energy sub metering",type="n")
lines(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Sub_metering_1)
lines(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Sub_metering_2,col="red")
lines(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power", type="n")
lines(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %T'),data$Global_reactive_power)

dev.off()  