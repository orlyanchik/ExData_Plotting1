
##Reading all the data from file
All_Data<-read.table("household_power_consumption.txt",sep=";")

## selecting interesting part of the data 
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
plot(FormTime_Data,as.numeric(as.character(Data$Global_active_power)), type="l",lwd=2, col="black",ylab = "Global Active Power (kilowatts)",xlab = " ")

## Saving the plot as .png file
dev.copy(device=png,filename="plot2.png",width=480,height=480);
dev.off ()