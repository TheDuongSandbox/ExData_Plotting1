library(dplyr)

fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
destFolder <- 'tmp'
zipFile <- file.path(destFolder, 'data.zip')
txtFile <- file.path(destFolder, 'household_power_consumption.txt')

downloadData <- function() {
  if (!file.exists(txtFile)) {
    if (!file.exists(zipFile)) {
      if (!dir.exists('tmp')) dir.create('tmp')
      download.file(fileUrl, zipFile)
    } 
    unzip(zipFile, exdir = destFolder)
  }
}

extractData <- function(filename) {
  data <- read.csv2(filename, na.strings = '?', stringsAsFactors = FALSE) %>% 
    filter(Date %in% c('1/2/2007', '2/2/2007')) %>% 
    mutate(Date = paste(Date, Time)) %>% 
    rename(Timestamp = Date) %>% 
    select(-Time)
  return(data.frame(
    data %>% select(Timestamp) %>% lapply(function(e) {strptime(e, format = '%d/%m/%Y %H:%M:%S')}),
    data %>% select(-Timestamp) %>% lapply(as.numeric)
  ))
}

getData <- function() {
  downloadData()
  return(extractData(txtFile))
}