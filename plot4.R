
## plot4.R
## Coursera Exploratory Data Analysis
## Course project 1
## Madhu Ram
## 5/23/15
## Read in power consumption data from large file and plot it

## use sqldf to retrieve data for time frame required only
library(sqldf)
setwd("C:/Users/mram/Documents/R/projects/ExData_Plotting1")
raw <- file("household_power_consumption.txt")
attr(raw, "file.format") <- list(sep=";", header = T)
raw.df <- sqldf("select * from raw where Date = '1/2/2007' or Date = '2/2/2007'")

## do conversions
raw.df$DateTime <- paste(raw.df$Date, raw.df$Time)
raw.df$DateTime <- strptime(raw.df$DateTime, "%d/%m/%Y %H:%M:%S")


#open png device
png("plot4.png")

#set the plotting parameters to 2 cols x 2 rows
par(mfcol=c(2,2))

##plot 1 - xy plot

plot(raw.df$DateTime, raw.df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")


##plot 2 - multiple lines

plot(raw.df$DateTime, raw.df$Sub_metering_1, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(raw.df$DateTime, raw.df$Sub_metering_2, col="red")
lines(raw.df$DateTime, raw.df$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3") ,lty = c(1,1,1), col = c("black", "red", "blue")) 


#plot 3 - voltage

plot(raw.df$DateTime, raw.df$Voltage, type="l", xlab = "", ylab = "Voltage")

#plot 4 - reactive power

plot(raw.df$DateTime, raw.df$Global_reactive_power, type="l", xlab = "", ylab = "Global Reactive Power")

dev.off()

