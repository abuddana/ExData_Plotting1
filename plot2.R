##Read the entire file 
fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"proj1.zip")
read.table(unzip("proj1.zip",exdir="."),sep = ";",header=TRUE)->data1

## Subset it accordingly by the date variable
data_s<-subset(data1,as.Date(data1$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(data1$Date,"%d/%m/%Y")=="2007-02-02")

## Get a continuos variable for a line plot
data_s$dateTime<-paste(data_s$Date,data_s$Time)
data_s$dateTime <- as.POSIXct(strptime(data_s$dateTime, "%d/%m/%Y %H:%M:%S"))

##Open PNG device and plot the line plot
png(filename="plot2.png", width=480, height=480)
plot(as.numeric(as.character(data_s$Global_active_power))~data_s$dateTime,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()