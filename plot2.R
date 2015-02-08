## Creating the plot #2

#################################################################
## read the source data
data <- read.table("./data/household_power_consumption.txt", 
                   sep=";", skip=66637, nrows=2880)

colnames(data) <- list("Date", "Time", "Global_active_power", 
           "Global_reactive_power", "Voltage", "Global_intensity", 
           "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


#################################################################
## convert the Date and Time variables to  a Date/Time class
dateTime <- paste(as.character(data$Date), as.character(data$Time))
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")


#################################################################
## plot to a window (the screen) 
plot(dateTime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


#################################################################
## copy the screen to a PDF file
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()