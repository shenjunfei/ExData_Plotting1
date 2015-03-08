proj<-read.table("household_power_consumption.txt",skip= 66637 ,nrows= 2881, sep=";")
dt<-paste(proj$V1, proj$V2)
date_time<-strptime(dt,"%d/%m/%Y %H:%M:%S")
data<-cbind(date_time,proj[ ,3:9])
names(data)<-c("Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(data$Global_active_power~data$Time, type="l", 
     xlab= "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()
