##Read the entire file 
fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"proj1.zip")
read.table(unzip("proj1.zip",exdir="."),sep = ";",header=TRUE)->data1

## Subset it accordingly by the date variable
data_s<-subset(data1,as.Date(data1$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(data1$Date,"%d/%m/%Y")=="2007-02-02")

##Open PNG device and plot histogram 
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(as.character(data_s$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

