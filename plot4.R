#Read the data from the file provided from the http://archive.ics.uci.edu/ml/ (UC Irvine Machine Learning Repository). 
#The unzipped file should be in the working directory.
data<-read.table("household_power_consumption.txt",sep=";", header= TRUE,stringsAsFactors=FALSE, na.strings = "?")
#Read the data from the first of February 2007 and then from the second of February 2007 and join them together)
fromthefirst<-data[data$Date=='1/2/2007',]
fromthesecond<-data[data$Date=='2/2/2007',]
thetwo<-rbind(fromthefirst,fromthesecond)
library(dplyr)
fulldate<-strptime(paste(thetwo$Date,thetwo$Time),format='%d/%m/%Y %H:%M:%S')
sourcedata<-cbind(thetwo,fulldate)
sourcedata<-select(sourcedata,fulldate,as.numeric(Global_active_power),as.numeric(Sub_metering_1),as.numeric(Sub_metering_2),as.numeric(Sub_metering_3), as.numeric(Voltage), as.numeric(Global_reactive_power))

par(mfrow=c(2,2))

with(sourcedata,{
	plot(fulldate,Global_active_power,main="",xlab="",ylab="Global Active Power",type="n")
	lines(fulldate,Global_active_power,type="l")
	plot(fulldate,Voltage,main="",xlab="datetime",ylab="Voltage",type="n")
	lines(fulldate,Voltage,type="l")
	plot(fulldate,Sub_metering_1,main="",xlab="",ylab="Energy sub metering",type="n")
	lines(fulldate,Sub_metering_1,type="l", col="black")
	lines(fulldate,Sub_metering_2,type="l", col="red")
	lines(fulldate,Sub_metering_3,type="l", col="blue")
	legend("topright", lty = c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1  ", "Sub_metering_2  ","Sub_metering_3  "), bty="n", cex=.85) 
	plot(fulldate,Global_reactive_power,main="",xlab="datetime",ylab="Global_reactive_power",type="n")
	lines(fulldate,Global_reactive_power,type="l")
	})

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off()
