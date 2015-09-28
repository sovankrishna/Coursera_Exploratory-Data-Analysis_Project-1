# Getting the dataset
data_epa1 <- read.csv("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", 
                      quote='\"')

# Changing the date format & Class of Date variable
data_epa1$Date <- as.Date(data_epa1$Date, format="%d/%m/%Y")


# Subsetting the dataset as needed first 2 days of february 2007
data <- subset(data_epa1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_epa1)

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# creating histogram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving to png file and naming plot1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
