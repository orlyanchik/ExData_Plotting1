
## selecting interesting part of the data 
All_Data<-read.table("household_power_consumption.txt",sep=";")
choosen_rows1=All_Data$V1=="1/2/2007"
choosen_rows2=All_Data$V1=="2/2/2007"
Data<-rbind(All_Data[choosen_rows1,],All_Data[choosen_rows2,])
col_names<-c("Date","Time","Global_active_power", "Global_reactive_power","Voltage",
             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(Data)<-col_names

## Selecting and formating date and time data
NotFormTime_Data<-paste(Data$Date,Data$Time)
FormTime_Data<-strptime(NotFormTime_Data,"%d/%m/%Y %H:%M:%S")

## Creating the plot in R
par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(FormTime_Data,as.numeric(as.character(Data$Global_active_power)), type="l",lwd=2, col="black",ylab = "Global Active Power (kilowatts)",xlab = " ")

plot(FormTime_Data,as.numeric(as.character(Data$Voltage)), type="l",lwd=2, col="black",ylab = "Voltage",xlab = "datetime")

plot(FormTime_Data,as.numeric(as.character(Data$Sub_metering_1)), type="l",lwd=2, col="black",ylab = "Energy sub metering",xlab = " ")
lines(FormTime_Data,as.numeric(as.character(Data$Sub_metering_2)), lwd=2, col="red")
lines(FormTime_Data,as.numeric(as.character(Data$Sub_metering_3)), lwd=2, col="blue")
legend("topright", legend=c("Sub_metering_1                ","Sub_metering_2               ","Sub_metering_3               "), lwd=c(2,2,2), col=c("black","red","blue"),bty="n")

plot(FormTime_Data,as.numeric(as.character(Data$Global_reactive_power)), type="l",lwd=2, col="black",xlab = "datetime",ylab="Global_reactive_power")

## Saving the plot as .png file
dev.copy(device=png,filename="plot4.png",width=480,height=480);
dev.off ()