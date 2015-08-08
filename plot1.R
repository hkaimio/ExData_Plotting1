# Coursera Exploratory Data Analysis, project 1

# Harri Kaimio

# This file is only a driver for generating the needed plot
# All data reading and plotting logic is implemented in lib/power_consumption.R
# due to code reuse and easier debugging

source( "lib/power_consumption.R")

d <- read_power_data( "../data/household_power_consumption.txt" )
png( "plot1.png", 480, 480 )
plot_global_power_hist( d )
dev.off()