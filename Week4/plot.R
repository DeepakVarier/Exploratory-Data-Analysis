# plot1.R
#--------------------------
# this script does the following
# 1. download data from UCI Machine Learning Repository
# 2. read the data into R
# 3. inspect and recode the data
# 4. plot the data
# =========================


url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
dest <- 'NEI.zip'
download.file( url, dest )
source.files <- unzip( dest, list = TRUE )$Name
unzip(dest)
file.remove(dest)
rm(url)
rm(dest)


# 2. read the data into R, save, and remove source file
print(source.files)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
# clean up
file.remove( source.files )
rm(source.files)
# save to RData file
save.image( 'NEI.RData' )


# 3. inspect data and recode
str(SCC)
head(SCC)
str(NEI)
head(NEI)
names(SCC)
names(NEI)
new.names <- gsub( '_', '.', names(SCC)  )
new.names <- tolower( new.names )
names( SCC ) <- new.names
new.names <- gsub( '_', '.', names(NEI)  )
new.names <- tolower( new.names )
names( NEI ) <- new.names
names(SCC)
names(NEI)
rm(new.names)
save.image( 'NEI.RData' )


# 4. plot the data
# summarize the data
library(plyr)
emissions <- ddply(NEI, .(year), summarize, total.emissions = sum(emissions) )
# plot the data
png('plot1.png')
plot(emissions, type='l')
dev.off()
