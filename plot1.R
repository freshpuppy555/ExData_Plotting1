# read in data
data <- read.table("household_power_consumption.txt", TRUE, ";", na.strings = "?")

# subset data for two specific dates and bind data frames together
date1 <- subset(data, Date == "1/2/2007")
date2 <- subset(data, Date == "2/2/2007")
dat_sub <- rbind(date1,date2)

# create plot 1 and png file
png("plot1.png", width=480, height=480)
hist(dat_sub$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")
dev.off()