## Exploratory analisys course project 1 plot 2

unzip("exdata-data-household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, na.strings="?")
header <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=1)
colnames(data) <- colnames(header)
rm(header)

data <- cbind(strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S"), data[,c(-1,-2)])
colnames(data)[1] <- "Date.Time"

png(filename="plot2.png")
plot(data$Date.Time, data$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", type="s")
dev.off()

rm(data)