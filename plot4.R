# Getting the dataset
data_epa1 <- read.csv("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", 
                      quote='\"')

# Converting the date format and class of the variable Date
data_epa1$Date <- as.Date(data_epa1$Date, format = "%d/%m/%Y")

# Subsetting the dataset as needed first 2 days of february 2007
data <- subset(data_epa1, subset=("2007-2-1"<=Date & Date<="2007-2-2"))

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Creating 2x2 Plot
par( mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data,{
  # Plot 1
  plot(data$Global_active_power ~ data$Datetime, type="l", 
       xlab="", ylab= "Global Active Power (Kilowatts)")
  # Plot 2
  plot(data$Sub_metering_1 ~ data$Datetime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(data$Sub_metering_2 ~ data$Datetime, col = "Red")
  lines(data$Sub_metering_3 ~ data$Datetime, col = "Blue")
  legend("topright",
       col = c("black", "red", "blue"), lty = 1, lwd = 1,
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
  # Plot 3
  plot(data$Voltage ~ data$Datetime, type="l", 
       xlab="datetime", ylab= "Voltage")
  # Plot 4
  plot(data$Global_reactive_power ~ data$Datetime, type="l", 
       xlab="datetime", ylab= "Global_reactive_power")
  })

# Saving the plot to png file and naming plot3.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

