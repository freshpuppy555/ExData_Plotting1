# read in data
data <- read.table("household_power_consumption.txt", TRUE, ";", na.strings = "?")

# subset data for two specific dates and bind data frames together
date1 <- subset(data, Date == "1/2/2007")
date2 <- subset(data, Date == "2/2/2007")
dat_sub <- rbind(date1,date2)

## coerce date and time data into classes and replace columns with update classes
date <- as.Date(dat_sub[, 1], format = "%d/%m/%Y")
time <- strptime(paste(dat_sub$Date, dat_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dat_sub$Date <- date
dat_sub$Time <- time

png("plot2.png", width=480, height=480)
with(dat_sub, plot(Time, Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)"))
dev.off()