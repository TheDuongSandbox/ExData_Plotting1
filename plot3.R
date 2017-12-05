source('getData.R')
source('generatePngPlot.R')
source('drawPlot3.R')

generatePngPlot('plot3', function(){ drawPlot3(getData()) })