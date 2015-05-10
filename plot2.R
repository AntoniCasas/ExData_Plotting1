data <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE) #we read the data

data$Date <- as.Date(data$Date,"%d/%m/%Y") #we convert Factor into Date with right format

subset <- data[data$Date >= '2007-02-01' & data$Date < '2007-02-03',] #we subset the data

subset$Global_active_power <- as.numeric(levels(subset$Global_active_power))[subset$Global_active_power] #we convert Factor into numeric
subset$DateTime <- as.POSIXct(paste(subset$Date, as.character(subset$Time))) #we create a new column with DateTime

png("plot2.png", width = 480,height = 480) #we will use a PNG device to save the graphic device

plot(subset$DateTime,subset$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)") #we run the plot with lines instead of dots

dev.off() #we close the PNG graphic device
