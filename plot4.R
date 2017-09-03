# read in data
data <- read.table("household_power_consumption.txt", TRUE, ";", na.strings = "?")

# subset data for specific dates and bind data frames together
date1 <- subset(data, Date == "1/2/2007")
date2 <- subset(data, Date == "2/2/2007")
dat_sub <- rbind(date1,date2)

## coerce date and time data into classes and replace columns with update classes
date <- as.Date(dat_sub[, 1], format = "%d/%m/%Y")
time <- strptime(paste(dat_sub$Date, dat_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dat_sub$Date <- date
dat_sub$Time <- time


# open PNG graphics device and set up 2 by 2 plot to cill columns first
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))

#plot top left1
with(dat_sub, plot(Time, Global_active_power, type="l", xlab="", 
                   ylab="Global Active Power (kilowatts)"))
# plot bottom left
with(dat_sub, plot(Time, Sub_metering_1, type="l", xlab="", 
                   ylab="Energy sub metering"))
with(dat_sub, lines(Time, Sub_metering_2, col = "red"))
with(dat_sub, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# plot top right
with(dat_sub, plot(Time, Voltage, type="l", xlab="datetime", 
                   ylab="Voltage"))

# plot bottom right
with(dat_sub, plot(Time, Global_reactive_power, type="l", xlab="datetime", 
                   ylab="Global_reactive_power"))

# close PNG graphics device 
dev.off()