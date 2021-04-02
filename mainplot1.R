library("data.table")
setwd("C:/Users/Saurav Mohapatra/Desktop/Coursera/Assignment1")
pd <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
pd[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
pd[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
pd <- pd[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot100.png", width=480, height=480)

hist(pd[,Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts", ylab="Frequency", col="Red")
dev.off()