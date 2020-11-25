library(ggplot2)

setwd("~/Desktop/jhdatascience")
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract rows on 1/2/2007 and 2/2/2007
data0<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Save the plot (Histogram) into PNG file.

png("plot1.png",width=480,height=480)

#Create the Histogram of Flobal Active Power
hist(as.numeric(data0$Global_active_power),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

#Close the PNG file


dev.off()         

#extract only the rows that we need, i.e. rows on 1/2/2007 and 2/2/2007
data<-data0[data0$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Set Global active power into numeric
GlobalActivePower<-as.numeric(data$Global_active_power)

#Save the plot (Line XY Plot) into PNG file.
png("plot2.png",width=480,height=480)
#Create the Line XY Plot of Global Active Power and Date,Time
plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power (kilowatts)")
#Close the PNG file
dev.off()


setwd("~/Documents/jhdatascience")
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract only the rows that we need, i.e. rows on 1/2/2007 and 2/2/2007
data<-data0[data0$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Set Sub metering values into Numeric
submetering1<-as.numeric(data$Sub_metering_1)
submetering2<-as.numeric(data$Sub_metering_2)
submetering3<-as.numeric(data$Sub_metering_3)

#Save the plot (Line XY Plot) into PNG file.
png("plot3.png",width=480,height=480)
#Create first the Line XY plot of DateTime and submetering1
plot(DateTime,submetering1,type="l",ylab="Energy sub metering")
#Second, add the Line XY plot of submetering2 -> with a different color
lines(DateTime,submetering2,type="l",col="red")
#Then add the ine XY plot of submetering3
lines(DateTime,submetering3,type="l",col="blue")
#Add Legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Close the PNG file
dev.off()


#extract only the rows that we need, i.e. rows on 1/2/2007 and 2/2/2007
data<-data0[data0$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Set Variables into Numeric
GlobalActivePower<-as.numeric(data$Global_active_power)
GlobalReactivePower<-as.numeric(data$Global_reactive_power)
Voltage1<-as.numeric(data$Voltage)
submetering1<-as.numeric(data$Sub_metering_1)
submetering2<-as.numeric(data$Sub_metering_2)
submetering3<-as.numeric(data$Sub_metering_3)

#Save the plot (Line XY Plot) into PNG file.
png("plot4.png",width=480,height=480)
#Set the layout to have 4 plots
par(mfrow=c(2,2))

#Plot1 (topleft)
plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power",xlab="")
#Plot2 (topright)
plot(DateTime,Voltage1,type="l",ylab="Voltage",xlab="datetime")
#Plot3 (bottomleft)
plot(DateTime,submetering1,type="l",ylab="Energy sub metering",xlab="")
lines(DateTime,submetering2,type="l",col="red")
lines(DateTime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Plot4 (bottomright)
plot(DateTime,GlobalReactivePower,type="l",ylab="Global_reactive_power",xlab="datetime")


#Close the PNG file
