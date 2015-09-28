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

# Creating the Plot
plot(data$Global_active_power ~ data$Datetime, 
     main="Global Active Power (Kilowatts)", 
     xlab="", ylab= "Global Active Power (Kilowatts)", 
     type="l")

# Saving the plot to png file and naming plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
