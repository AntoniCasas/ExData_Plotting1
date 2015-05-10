data <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE) #we read the data

data$Date <- as.Date(data$Date,"%d/%m/%Y") #we convert Factor into Date with right format

subset <- data[data$Date >= '2007-02-01' & data$Date < '2007-02-03',] #we subset the data

subset$Global_active_power <- as.numeric(levels(subset$Global_active_power))[subset$Global_active_power] #we convert Factor into numeric

png("plot1.png", width = 480,height = 480) #we will use a PNG device to save the graphic device

hist(subset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red") #we run the histogram

dev.off() #we close the PNG graphic device

