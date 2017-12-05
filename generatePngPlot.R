generatePngPlot <- function(plotName, drawingFunc) {
  png(paste0(plotName, '.png'), width = 480, height = 480)
  drawingFunc()
  dev.off()
}