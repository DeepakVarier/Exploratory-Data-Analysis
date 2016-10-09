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
EPC_plot2 <- subset(EPC,EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02")


# Converting dates

date_time <- paste(as.Date(EPC_plot2$Date),EPC_plot2$Time)
EPC_plot2$Datetime <- as.POSIXct(date_time)
attach(EPC_plot2)
# Plot 2
plot(Global_active_power~Datetime, type='l',ylab = "Global Active Power (kilowatts)", xlab ="")

# Save the plot as .png file
dev.copy(png, file = "plot2.png",height = 480, width = 480)
dev.off()
detach(EPC_plot2)