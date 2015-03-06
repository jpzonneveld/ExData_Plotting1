## Coursera, Exploratory Data Analysis, March 2015
## Course project 1, plot2
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



## Generate plot2.png
png(filename = "plot2.png", width = 480, height = 480)

par(mfrow = c(1,1))

plot(reqdata$Global_active_power, 
            type = "l", 
            xlab= "", 
            xaxt = "n", 
            ylab = "Global Active Power(kilowatts)"
     )
axis(1, at=c(1,1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
message("plot2.png has been created in your working directory")
rm(reqdata)