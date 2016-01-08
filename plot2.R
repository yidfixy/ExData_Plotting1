#Read in extracted data to table
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Turn DateTime into an object
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Isolate the y axis
globalActivePower <- as.numeric(data$Global_active_power)

#Create file and graph
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Print to file
dev.off()