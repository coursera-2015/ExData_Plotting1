## Creating the plot #1
rm(list = ls())

#################################################################
## read the source data
data <- read.table("./data/household_power_consumption.txt", 
                   sep=";", skip=66637, nrows=2880, na.strings="?")

colnames(data) <- list("Date", "Time", "Global_active_power", 
            "Global_reactive_power", "Voltage", "Global_intensity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


#################################################################
## open PNG graphics device
png("plot1.png", width = 480, height = 480)


#################################################################
## plot to the graphics device
hist(data$Global_active_power, col = "red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")


#################################################################
## close the graphics devic
dev.off()

