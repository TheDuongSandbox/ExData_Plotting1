source('generatePngPlot.R')
source('getData.R')
data <- getData()

generatePngPlot('plot1', function() {
  hist(data$Global_active_power,
     col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
})