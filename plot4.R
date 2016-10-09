# Exploratory Data Analysis plot 2
rm(list = ls())
getwd()
# Read te Electric Power Consumption Dataset into R

EPC <- read.table(file.choose(),header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)
head(EPC)
summary(EPC)

# change to date class using as.Date function

EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
head(EPC$Date)
class(EPC$Date)

# Subset data for 2 dates - 2007-02-01 and 2007-02-02
EPC_plot4 <- subset(EPC,EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02")


# Converting dates

date_time <- paste(as.Date(EPC_plot4$Date),EPC_plot4$Time)
EPC_plot4$Datetime <- as.POSIXct(date_time)

attach(EPC_plot4)
# set mfrow = 2x2 for plotting the 4 graphs

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(Global_active_power~Datetime, type='l',ylab = "Global Active Power (kilowatts)", xlab ="")
plot(Voltage~Datetime, type='l',ylab = "Voltage (volt)", xlab ="")
plot(Sub_metering_1~Datetime, type='l',ylab = "Global Active Power (kilowatts)", xlab ="")
lines(Sub_metering_2~Datetime,col = "Red")
lines(Sub_metering_3~Datetime,col = "Blue")
legend("topright",col = c("black","Red","Blue"),cex=0.4,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(Global_reactive_power~Datetime, type='l',ylab = "Global_Reactive_Power (kilowatts)", xlab ="")

# Save the plot as .png file
dev.copy(png, file = "plot4.png",height = 480, width = 480)
dev.off()
detach(EPC_plot4)