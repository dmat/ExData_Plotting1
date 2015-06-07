library(sqldf)

f <- file("ExData_Plotting1/household_power_consumption.txt")
df <- sqldf("select * from f where Date = '1/2/2007' or Date = '2/2/2007' ",file.format = list(header = TRUE, sep = ";"))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- transform(df, Datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

par(mfrow=c(2,2))

## plot 1
plot(df$Datetime,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")


## plot 2
plot(df$Datetime,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

##plot 3
plot(df$Datetime,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$Datetime,df$Sub_metering_2,col="red")
lines(df$Datetime,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 

## plot 4
plot(df$Datetime,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="ExData_Plotting1/plot4.png", width=480, height=480)
dev.off()