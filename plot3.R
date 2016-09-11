#Two functions.   The first to download the data.  Seperated out because of lenght of time to download.
#Second function will merge data sets and produce final results.


DownloadData <- function() {
  #Insure directory for class is available. 
  rwd <- "C:/2016/Mike_Classes/Exploratory Data Analysis/Working Directory"
  #If directory is not available create directory.
  if(!file.exists(rwd)){dir.create(rwd)}
  #Set working directory.
  setwd(rwd)
  #Create a variable with the directory to download files.
  assignData <- "./assignmentData"
  #Check that if directory exists.   If not create directory.
  if(!file.exists(assignData)){dir.create(assignData)}
  #Retrieve files and unzip into working directory.
  url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename <- paste(assignData,"/","zipData.zip", sep="")
  download.file(url,filename)
  unzip(zipfile=filename)
  
}

#Second function to process data and produce final results.

Plot3 <- function() {
  
  #load libraries
  
  #Set directory with data
  dataFile <-"C:/2016/Mike_Classes/Exploratory Data Analysis/Working Directory"
  
  #Import training data into tables
  read_plot3 <- read.table(paste(dataFile,"/household_power_consumption.txt", sep=""),header=TRUE,sep=";",dec=".", stringsAsFactors=FALSE)
  #Set Date and Hour Formats
  #Create a subset with two dates
  plot_data3 <- read_plot3[read_plot3$Date %in% c("1/2/2007","2/2/2007") ,]
  #remove file to save memory
  rm(read_plot3)
  datetime <- strptime(paste(plot_data3$Date, plot_data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  globalActivePower <- as.numeric(plot_data3$Global_active_power)
  Plot3_subMetering1 <- as.numeric(plot_data3$Sub_metering_1)
  Plot3_subMetering2 <- as.numeric(plot_data3$Sub_metering_2)
  Plot3_subMetering3 <- as.numeric(plot_data3$Sub_metering_3)
  
  png("plot3.png", width=480, height=480)
  plot(datetime, Plot3_subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, Plot3_subMetering2, type="l", col="red")
  lines(datetime, Plot3_subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.off()
  
  
  
}