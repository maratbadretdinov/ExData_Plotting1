## Exploratory analisys course project 1 plot 4

unzip("exdata-data-household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, na.strings="?")
header <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=1)
colnames(data) <- colnames(header)
rm(header)

data <- cbind(strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S"), data[,c(-1,-2)])
colnames(data)[1] <- "Date.Time"

# changing device parameters
par(mfcol=c(2,2))
par(ps=12)

# plot 1
plot(data$Date.Time, data$Global_active_power, main="", xlab="", ylab="Global Active Power", type="s")

# plot 2
plot(data$Date.Time, data$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="s")
points(data$Date.Time, data$Sub_metering_2, type="s", col="red")
points(data$Date.Time, data$Sub_metering_3, type="s", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), 
       bty="n", lty=1, cex=0.9)

# plot 3
plot(data$Date.Time, data$Voltage, main="", xlab="datetime", ylab="Voltage", type="s")

# plot 4
plot(data$Date.Time, data$Global_reactive_power, main="", xlab="datetime", ylab="Global_reactive_power", type="s")

# copy plot from screen device to png
dev.copy(png, filename="plot4.png")
dev.off()

rm(data)