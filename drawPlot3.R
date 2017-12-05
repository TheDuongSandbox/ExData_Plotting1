drawPlot3 <- function(data) {
  library(dplyr)
  library(xts)
  
  colors <- c('black', 'red', 'blue')
  timeseries <- xts(data %>% select(Sub_metering_1, Sub_metering_2, Sub_metering_3), order.by = data$Timestamp)
  plot.zoo(timeseries, screens = 1, xlab = NA, ylab = 'Energy sub metering', col = colors)
  legend('topright', legend = names(timeseries), col = colors, lwd = 1)
}