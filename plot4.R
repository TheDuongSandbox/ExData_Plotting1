library(xts)
source('getData.R')
source('drawPlot2.R')
source('drawPlot3.R')

drawPlots <- function() {
  data <- getData()
  drawPlot2(data)
  drawPlot3(data)
  plot.zoo(xts(data$Voltage, order.by = data$Timestamp), xlab = 'datetime', ylab = 'Voltage')
  plot.zoo(xts(data$Global_reactive_power, order.by = data$Timestamp), xlab = 'datetime', ylab = 'Global_reactive_power')
}

png('plot4.png', width = 480, height = 480)
par(mfcol = c(2,2))
drawPlots()
dev.off()