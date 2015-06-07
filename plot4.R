##Read the entire file 
fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"proj1.zip")
read.table(unzip("proj1.zip",exdir="."),sep = ";",header=TRUE)->data1

## Subset it accordingly by the date variable
data_s<-subset(data1,as.Date(data1$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(data1$Date,"%d/%m/%Y")=="2007-02-02")

## Get a continuos variable for a line plot
data_s$dateTime<-paste(data_s$Date,data_s$Time)
data_s$dateTime <- as.POSIXct(strptime(data_s$dateTime, "%d/%m/%Y %H:%M:%S"))

##Open PNG device 
png(filename="plot4.png", width=480, height=480)

##Prepare the lattice with 2 rows and 2 columns
par(mfrow=c(2,2))

## Start with top left as the first chart
plot(as.numeric(as.character(data_s$Global_active_power))~data_s$dateTime,type="l",ylab="Global Active Power(kilowatts)",xlab="")

## Second chart
plot(as.numeric(as.character(data_s$Voltage))~data_s$dateTime,type="l",ylab="Voltage",xlab="datetime")

## Third chart - no box for legend
plot(as.numeric(as.character(data_s$Sub_metering_1))~data_s$dateTime,type="n",ylab="Energy sub metering",xlab="")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),ncol=1,lwd=2,col=c("grey","red","blue"),bty='n')
points(as.numeric(as.character(data_s$Sub_metering_1))~data_s$dateTime,type="l",col="grey",lwd=2)
points(as.numeric(as.character(data_s$Sub_metering_2))~data_s$dateTime,type="l",col="red",lwd=2)
points(as.numeric(as.character(data_s$Sub_metering_3))~data_s$dateTime,type="l",col="blue",lwd=2)

## Fourth chart
plot(as.numeric(as.character(data_s$Global_reactive_power))~data_s$dateTime,type="l",ylab="Global Reactive Power(kilowatts)",xlab="datetime")
dev.off()