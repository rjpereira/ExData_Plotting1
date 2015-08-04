# Set current working directory
setwd('~/Downloads/plot/ExData_Plotting1')

# Read Data
# Read as dataframe as na.strings was giving me trouble with ?
x<-read.csv('household_power_consumption.txt',na.strings = c('?'),sep=';')
# Convert to data.table for performance
y<-data.table(x)
# Convert date format
y$DateTime<-as.POSIXct(paste(y$Date, y$Time), format="%d/%m/%Y %H:%M:%S")
y$Date<-as.Date(y$Date,'%d/%m/%Y')

# Slice for only the interesting dates
z<-y[y$Date>='2007-02-01' & y$Date<='2007-02-02',]

# Create 1x1 panel : normally not needed but used to reset chart 4
par(mfrow=c(1,1))

plot(x=z$DateTime,
     y=z$Sub_metering_1,
     type='l',
     ylab='Energy sub metering')
lines(x=z$DateTime,y=z$Sub_metering_2,col='red')
lines(x=z$DateTime,y=z$Sub_metering_3,col='blue')
legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1,1),
       col=c('black','red','blue'))

dev.copy(png,'plot3.png',width=480,height=480,units='px')
dev.off()