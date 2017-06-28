
## selecting interesting part of the data 
All_Data<-read.table("household_power_consumption.txt",sep=";")
choosen_rows1=All_Data$V1=="1/2/2007"
choosen_rows2=All_Data$V1=="2/2/2007"
Data<-rbind(All_Data[choosen_rows1,],All_Data[choosen_rows2,])
col_names<-c("Date","Time","Global_active_power", "Global_reactive_power","Voltage",
     "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(Data)<-col_names

## Creating the plot in R
hist(as.numeric(as.character(Data$Global_active_power)),col = "red",main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Saving the plot as .png file
dev.copy(device=png,filename="plot1.png",width=480,height=480);
dev.off ()