datafile <- "../data/household_power_consumption.txt"

library(dplyr)
library(readr)
library(lubridate)

read_power_data <- function( fname )
{
  data <- read_delim(fname, delim = ";", na = "?")
  
  data <- tbl_df(data)
  data <- data %>% mutate( SampleTime = dmy_hms(sprintf("%s %s", Date, Time )))

  data %>% filter( SampleTime >= ymd("2007-02-01") & SampleTime < ymd("2007-02-03" ))
}

plot_global_power_hist <- function( d )
{
  hist( d$Global_active_power, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", ylab = "Frequency"  )
}

plot_global_act_pow <- function( d )
{
  plot(d$SampleTime, d$Global_active_power, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "" )
}

plot_sub_metering <- function ( d )
{
  plot(d$SampleTime, d$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "" )
  lines(d$SampleTime, d$Sub_metering_2, col = "red")
  lines(d$SampleTime, d$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_Metering_3"), 
         col= c("black","red","blue"), lty = 1)
  
}

plot_voltage <- function(d)
{
  plot( d$SampleTime, d$Voltage, xlab = "datetime", ylab = "Voltage", type = "l" )
}


plot_reactive_power <- function(d)
{
  plot( d$SampleTime, d$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l" )
}