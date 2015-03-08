proj<-read.table("household_power_consumption.txt",skip= 66637 ,nrows= 2881, sep=";")
dt<-paste(proj$V1, proj$V2)
date_time<-strptime(dt,"%d/%m/%Y %H:%M:%S")
data<-cbind(date_time,proj[ ,3:9])
names(data)<-c("Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

par(mfrow=c(2,2))

plot(data$Global_active_power~data$Time, type="l", 
     xlab= "", ylab="Global Active Power")

plot(data$Voltage~data$Time, type="l", 
     xlab="datatime", ylab="Voltage")

Time<-c(data$Time, data$Time, data$Time)
Sub_metering<-c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)
g<-gl(3,2881,labels=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(Time, Sub_metering, xlab="", ylab="Energy sub metering",type="n")
points(Time[g=="Sub_metering_1"],Sub_metering[g=="Sub_metering_1"],type="l")
points(Time[g=="Sub_metering_2"],Sub_metering[g=="Sub_metering_2"],type="l",col="red")
points(Time[g=="Sub_metering_3"],Sub_metering[g=="Sub_metering_3"],type="l",col="blue")
legend("topright",legend=unique(g), pch="_", col=c("black","red","blue"), cex=0.2)

plot(data$Global_reactive_power~data$Time, type="l", 
     xlab="datatime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()