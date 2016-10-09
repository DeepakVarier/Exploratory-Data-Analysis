# Exploratory Data Analysis plot 3
rm(list = ls())
getwd()
# Read te Electric Power Consumption Dataset into R

EPC_plot3 <- read.table(file.choose(),header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)
head(EPC_plot3)
summary(EPC_plot3)

# change to date class using as.Date function

EPC_plot3$Date <- as.Date(EPC_plot3$Date, format = "%d/%m/%Y")
head(EPC_plot3$Date)
class(EPC_plot3$Date)

# Subset data for 2 dates - 2007-02-01 and 2007-02-02
EPC_subsetplot3 <- subset(EPC_plot3,EPC_plot3$Date >= "2007-02-01" & EPC_plot3$Date <= "2007-02-02")


# Converting dates

date_time <- paste(as.Date(EPC_subsetplot3$Date),EPC_subsetplot3$Time)
EPC_subsetplot3$Datetime <- as.POSIXct(date_time)
attach(EPC_subsetplot3)

# Plot 3

plot(Sub_metering_1~Datetime, type='l',ylab = "Global Active Power (kilowatts)", xlab ="")
lines(Sub_metering_2~Datetime,col = "Red")
lines(Sub_metering_3~Datetime,col = "Blue")
legend("topright",col = c("black","Red","Blue"),lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Save the plot as .png file
dev.copy(png, file = "plot3.png",height = 480, width = 480)
dev.off()

detach(EPC_subsetplot3)
