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

Plot4 <- function() {
  
  #load libraries
  
  #Set directory with data
  dataFile <-"C:/2016/Mike_Classes/Exploratory Data Analysis/Working Directory"
  
  #Import training data into tables
  read_plot4 <- read.table(paste(dataFile,"/household_power_consumption.txt", sep=""),header=TRUE,sep=";",dec=".", stringsAsFactors=FALSE)
  #Set Date and Hour Formats
  #Create a subset with two dates
  plot_data4 <- read_plot4[read_plot4$Date %in% c("1/2/2007","2/2/2007") ,]
  #remove file to save memory
  rm(read_plot4)
  #assign correct formats
  datetime <- strptime(paste(plot_data4$Date, plot_data4$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  globalActivePower <- as.numeric(plot_data4$Global_active_power)
  globalReactivePower <- as.numeric(plot_data4$Global_reactive_power)
  voltage <- as.numeric(plot_data4$Voltage)
  Plot4_subMetering1 <- as.numeric(plot_data4$Sub_metering_1)
  Plot4_subMetering2 <- as.numeric(plot_data4$Sub_metering_2)
  Plot4_subMetering3 <- as.numeric(plot_data4$Sub_metering_3)
 
  #plot graph
  
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 
  
  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  
  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(datetime, Plot4_subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, Plot4_subMetering2, type="l", col="red")
  lines(datetime, Plot4_subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  
  plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
   
  
}