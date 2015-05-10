data <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE) #we read the data

data$Date <- as.Date(data$Date,"%d/%m/%Y") #we convert Factor into Date with right format

subset <- data[data$Date >= '2007-02-01' & data$Date < '2007-02-03',] #we subset the data

subset$Global_active_power <- as.numeric(levels(subset$Global_active_power))[subset$Global_active_power] #we convert Factor into numeric
subset$Sub_metering_1 <- as.numeric(levels(subset$Sub_metering_1))[subset$Sub_metering_1] #we convert Factor into numeric
subset$Sub_metering_2 <- as.numeric(levels(subset$Sub_metering_2))[subset$Sub_metering_2] #we convert Factor into numeric
subset$DateTime <- as.POSIXct(paste(subset$Date, as.character(subset$Time))) #we create a new column with DateTime

png("plot3.png", width = 480,height = 480) #we will use a PNG device to save the graphic device

plot(subset$DateTime,subset$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering", col="Black") #we run the plot with lines using y as "Sub_metering_1" in black
lines(subset$DateTime,subset$Sub_metering_2, type="l",xlab="",ylab="Energy sub metering", col="Red") #we add lines using y as "Sub_metering_2" in red
lines(subset$DateTime,subset$Sub_metering_3, type="l",xlab="",ylab="Energy sub metering", col="Blue") #we add lines using y as "Sub_metering_3" in blue
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue")) #we add the legend

dev.off() #we close the PNG graphic device
