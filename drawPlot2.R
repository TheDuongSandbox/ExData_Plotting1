drawPlot2 <- function(data) {
  library(xts)
  
  timeseries <- xts(data$Global_active_power, order.by = data$Timestamp)
  plot.zoo(timeseries, xlab = NA, ylab = 'Global Active Power (kilowatts)')
}