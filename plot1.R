# Set current working directory
setwd('~/Downloads/plot/ExData_Plotting1')

# Read Data
# Read as dataframe as na.strings was giving me trouble with ?
x<-read.csv('household_power_consumption.txt',na.strings = c('?'),sep=';')
# Convert to data.table for performance
y<-data.table(x)
# Convert date format
y$Date<-as.Date(y$Date,'%d/%m/%Y')
# Slice for only the interesting dates
z<-y[y$Date>='2007-02-01' & y$Date<='2007-02-02',]

# Create 1x1 panel : normally not needed but used to reset chart 4
par(mfrow=c(1,1))

hist(z$Global_active_power,
     xlab='Global Active Power (kilowatts)',
     col='red',
     main='Global Active Power')

dev.copy(png,'plot1.png',width=480,height=480,units='px')
dev.off()