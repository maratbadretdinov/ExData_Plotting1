## Exploratory analisys course project 1 plot 1

unzip("exdata-data-household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, na.strings="?")
header <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=1)
colnames(data) <- colnames(header)
rm(header)

data <- cbind(strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S"), data[,c(-1,-2)])
colnames(data)[1] <- "Date.Time"

png(filename="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

rm(data)