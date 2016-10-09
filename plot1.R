# Exploratory Data Analysis
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

attach(EPC)

# Subset data for 2 dates - 2007-02-01 and 2007-02-02
EPC_set1 <- subset(EPC,Date >= "2007-02-01" & Date <= "2007-02-02")


# Converting dates

date_time <- paste(as.Date(Date),Time)
EPC_set1$Datetime <- as.POSIXct(date_time)
detach(EPC)
rm(EPC)

attach(EPC_set1)
# Plotting the histogram

hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save the plot as .png file
dev.copy(png, file = "plot1.png",height = 480, width = 480)
dev.off()

detach(EPC_set1)