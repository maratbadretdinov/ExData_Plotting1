## Exploratory analisys course project 1 plot 3

unzip("exdata-data-household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, na.strings="?")
header <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=1)
colnames(data) <- colnames(header)
rm(header)

data <- cbind(strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S"), data[,c(-1,-2)])
colnames(data)[1] <- "Date.Time"

png(filename="plot3.png")

plot(data$Date.Time, data$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="s")
points(data$Date.Time, data$Sub_metering_2, type="s", col="red")
points(data$Date.Time, data$Sub_metering_3, type="s", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1)

dev.off()

rm(data)