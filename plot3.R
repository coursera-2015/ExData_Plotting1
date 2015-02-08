## Creating the plot #3

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
## plot to a window (the screen) 
plot(dateTime, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")

lines(dateTime, data$Sub_metering_2, col="red")

lines(dateTime, data$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), 
       lty = c(1, 1, 1), pch = c(NA, NA, NA),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#################################################################
## copy the screen to a PNG file
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()

