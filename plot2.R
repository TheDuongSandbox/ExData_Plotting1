source('getData.R')
source('generatePngPlot.R')
source('drawPlot2.R')

generatePngPlot('plot2', function(){ drawPlot2(getData()) })