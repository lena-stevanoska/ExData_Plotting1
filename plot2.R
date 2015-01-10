#Read the data from the file provided from the http://archive.ics.uci.edu/ml/ (UC Irvine Machine Learning Repository). The unzipped file should be in the working directory
data<-read.table("household_power_consumption.txt",sep=";", header= TRUE,stringsAsFactors=FALSE, na.strings = "?")
#Read the data from the first of February 2007 and then from the second of February 2007 and join them together)
fromthefirst<-data[data$Date=='1/2/2007',]
fromthesecond<-data[data$Date=='2/2/2007',]
thetwo<-rbind(fromthefirst,fromthesecond)
library(dplyr)	
fulldate<-strptime(paste(thetwo$Date,thetwo$Time),format='%d/%m/%Y %H:%M:%S')
sourcedata<-cbind(thetwo,fulldate)
sourcedata<-select(sourcedata,fulldate,as.numeric(Global_active_power))

with(sourcedata,plot(fulldate,Global_active_power,main="",xlab="",ylab="Global Active Power (kilowatts)",type="n"))
with(sourcedata,lines(fulldate,Global_active_power,type="l"))

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()
