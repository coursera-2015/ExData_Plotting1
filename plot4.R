## Creating the plot #4
rm(list = ls())

#################################################################
## read the source data
data <- read.table("./data/household_power_consumption.txt", 
                   sep=";", skip=66637, nrows=2880, na.strings="?")

colnames(data) <- list("Date", "Time", "Global_active_power", 
           "Global_reactive_power", "Voltage", "Global_intensity", 
           "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


#################################################################
## convert the Date and Time variables to  a Date/Time class
dateTime <- paste(as.character(data$Date), as.character(data$Time))
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")


#################################################################
## open PNG graphics device
png("plot4.png", width = 480, height = 480)


#################################################################
## plot to the graphics device
par(mfcol = c(2, 2))

## Global Active Power (top-left)
plot(dateTime, data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

## Energy sub metering (bottom-left)
plot(dateTime, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")

lines(dateTime, data$Sub_metering_2, col="red")

lines(dateTime, data$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), bty="n",
       lty = c(1, 1, 1), pch = c(NA, NA, NA),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Voltage (top-right)
plot(dateTime, data$Voltage, type="l", 
     ylab="Voltage", xlab="datetime")

## Global_reactive_power (bottom-right)
plot(dateTime, data$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime")


#################################################################
## close the graphics devic
dev.off()

## reset to default
par(mfcol = c(1, 1))
