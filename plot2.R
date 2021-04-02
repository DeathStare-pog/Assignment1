library("data.table")
setwd("C:/Users/Saurav Mohapatra/Desktop/Coursera/Assignment1")
pd <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
pd[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
pd[, Date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

pd <- pd[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot2.png", width=480, height=480)

plot(x = pd[, Date]
     , y = pd[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()