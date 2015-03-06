## Coursera, Exploratory Data Analysis, March 2015
## Course project 1, plot3
## 
## Please view the README.md in this repo to understand the the goal of
## this script, including the prerequisites. 
## ASSUMPTIONS:   
##   - The raw data is downloaded and extracted into the current working directory. 



## Loading and preparing the data
columnclasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                   "numeric", "numeric", "numeric")
rawdata <- read.csv("household_power_consumption.txt", header = TRUE, sep =";", 
                    na.strings = "?", colClasses = columnclasses)
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")

# Only keep data from 2007-02-01 till 2007-02-02
reqdata <- rawdata[(rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02"),]
rm(rawdata, columnclasses)



## Generate plot3.png
png(filename = "plot3.png", width = 480, height = 480)

par(mfrow = c(1,1))

# Setup plotting area
plot(reqdata$Sub_metering_1, 
            type = "n",
            xlab="",
            xaxt= "n", 
            ylab = "Energy sub metering"
     )

# Filling plot with data
points(reqdata$Sub_metering_1, col= "black", type = "l")
points(reqdata$Sub_metering_2, col= "red", type = "l")
points(reqdata$Sub_metering_3, col= "blue", type = "l")

# Adding axis and legend information
axis(1, at=c(1,1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", 
            bty = "o", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            lwd = c(0.5, 0.5, 0.5), 
            col = c("black", "red", "blue")
       )

dev.off()
message("plot3.png has been created in your working directory")
rm(reqdata)