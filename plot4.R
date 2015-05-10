data <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE) #we read the data

data$Date <- as.Date(data$Date,"%d/%m/%Y") #we convert Factor into Date with right format

subset <- data[data$Date >= '2007-02-01' & data$Date < '2007-02-03',] #we subset the data

subset$Global_active_power <- as.numeric(levels(subset$Global_active_power))[subset$Global_active_power] #we convert Factor into numeric
subset$Sub_metering_1 <- as.numeric(levels(subset$Sub_metering_1))[subset$Sub_metering_1] #we convert Factor into numeric
subset$Sub_metering_2 <- as.numeric(levels(subset$Sub_metering_2))[subset$Sub_metering_2] #we convert Factor into numeric
subset$DateTime <- as.POSIXct(paste(subset$Date, as.character(subset$Time))) #we create a new column with DateTime
subset$Voltage <- as.numeric(levels(subset$Voltage))[subset$Voltage] #we convert Factor into numeric
subset$Global_reactive_power <- as.numeric(levels(subset$Global_reactive_power))[subset$Global_reactive_power] #we convert Factor into numeric

png("plot4.png", width = 480,height = 480) #we will use a PNG device to save the graphic device

par(mfrow=c(2,2)) #we will have 4 plots into the same one (in 2 rows and 2 columns)

plot(subset$DateTime,subset$Global_active_power, type="l",xlab="",ylab="Global Active Power") #we run the plot on the top left position (row 1, column 1)

plot(subset$DateTime,subset$Voltage, type="l",xlab="datetime",ylab="Voltage") #we run the plot on the top right position (row 1, column 2)

plot(subset$DateTime,subset$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering", col="Black") #we run the plot on the bottom left position (row 2, column 1)
                                                                                                      #we run the plot with lines using y as "Sub_metering_1" in black
lines(subset$DateTime,subset$Sub_metering_2, type="l",xlab="",ylab="Energy sub metering", col="Red") #we add lines using y as "Sub_metering_2" in red
lines(subset$DateTime,subset$Sub_metering_3, type="l",xlab="",ylab="Energy sub metering", col="Blue") #we add lines using y as "Sub_metering_3" in blue
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex=1)

plot(subset$DateTime,subset$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power") #we run the plot on the bottom right position (row 2, column 2)

dev.off() #we close the PNG graphic device
