#Read the data from the file provided from the http://archive.ics.uci.edu/ml/ (UC Irvine Machine Learning Repository). The unzipped file should be in the working directory
data<-read.table("household_power_consumption.txt",sep=";", header= TRUE,stringsAsFactors=FALSE, na.strings = "?")
#Read the data from the first of February 2007 and then from the second of February 2007 and join them together)
fromthefirst<-data[data$Date=='1/2/2007',]
fromthesecond<-data[data$Date=='2/2/2007',]
thetwo<-rbind(fromthefirst,fromthesecond)
#Create the Histogram to the screen with the correct naming of axis, title and colour
library(datasets)
hist(thetwo$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")
#Save it in a PNG file
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()
