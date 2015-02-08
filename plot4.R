plot4 = function() {
  require(sqldf)
  file <- c("./data/household_power_consumption.txt")
  data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
  
  data_subset[data_subset == "?"] <- NA
  
  dateTime = as.POSIXlt(paste(as.Date(data_subset$Date, format="%d/%m/%Y"), data_subset$Time, sep=" "))
  
  png(file = "plot4.png")
  
  par(mfrow = c(2,2))
  
  plot(dateTime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  plot(dateTime, data_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(dateTime, data_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dateTime, data_subset$Sub_metering_2, col='red')
  lines(dateTime, data_subset$Sub_metering_3, col='blue')
  legend("topright", col=c("black","red","blue"), pch="-", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(dateTime, data_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
}