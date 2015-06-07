library(sqldf)

f <- file("ExData_Plotting1/household_power_consumption.txt")
df <- sqldf("select * from f where Date = '1/2/2007' or Date = '2/2/2007' ",file.format = list(header = TRUE, sep = ";"))
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()