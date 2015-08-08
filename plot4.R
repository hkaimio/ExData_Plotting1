# Coursera Exploratory Data Analysis, project 1

# Harri Kaimio

# This file is only a driver for generating the needed plot
# All data reading and plotting logic is implemented in lib/power_consumption.R
# due to code reuse and easier debugging

source( "lib/power_consumption.R")

d <- read_power_data( "../data/household_power_consumption.txt" )

png( "plot4.png", 480, 480 )
par(mfrow=c(2,2))
plot_global_act_pow(d)
plot_voltage(d)
plot_sub_metering( d )
plot_reactive_power(d)
dev.off()