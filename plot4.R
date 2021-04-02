library("data.table")
setwd("C:/Users/Saurav Mohapatra/Desktop/Coursera/Assignment1")
pd <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
pd[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
pd[, Date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
pd <- pd[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot4.png", width=480, height=480)


par(mfrow=c(2,2))

# P1
plot(pd[, Date], pd[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# P2
plot(pd[, Date],pd[, Voltage], type="l", xlab="Date", ylab="Voltage")

# P3
plot(pd[, Date], pd[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(pd[, Date], pd[, Sub_metering_2], col="red")
lines(pd[, Date], pd[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# P4
plot(pd[, Date], pd[,Global_reactive_power], type="l", xlab="Date", ylab="Global_reactive_power")

dev.off()
