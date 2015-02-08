plot2 = function() {
  require(sqldf)
  file <- c("./data/household_power_consumption.txt")
  data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
  
  data_subset[data_subset == "?"] <- NA
  
  dateTime = as.POSIXlt(paste(as.Date(data_subset$Date, format="%d/%m/%Y"), data_subset$Time, sep=" "))
    
  plot(dateTime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file = "plot2.png")
  
  dev.off()
}