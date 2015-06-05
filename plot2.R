## plot2.R
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


##plot 2 - xy plot
png("plot2.png")
plot(raw.df$DateTime, raw.df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

