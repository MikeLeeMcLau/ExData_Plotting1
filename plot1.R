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
  
Plot1 <- function() {
  
  #Set directory with data
  dataFile <-"C:/2016/Mike_Classes/Exploratory Data Analysis/Working Directory"
  
  #Import training data into tables
  read_plot1 <- read.table(paste(dataFile,"/household_power_consumption.txt", sep=""),header=TRUE,sep=";")
  #Set Date and Hour Formats
  #Create a subset with two dates
  
  #Set Date and time to date class
  #plot_data1$Date<-as.Date(plot_data1$Date, "%m/%d/%Y")
  #strptime(read_plot1$Date, "%H:%M:%S")
  #Remove big data set to save memory
  plot_data1 <- read_plot1[read_plot1$Date %in% c("1/2/2007","2/2/2007") ,]
  rm(read_plot1)
  #plot_data1 <- transform(plot_data1, timestamp=as.POSIXct(paste(Date, Time)))#, "%d/%m/%Y %H:%M:%S")
  #plot_data1$Global_active_power <- as.numeric(as.character(plot_data1$Global_active_power))
  plot_data1 <- plot_data1[order(plot_data1$Date, plot_data1$Time),]
  #create plot
  png(filename = "plot1.png",width = 480, height = 480, units = "px")
  hist(as.numeric(as.character(plot_data1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowats)")
  dev.off()
  
 
  
  
  
  
  

                         
  
  
  
}
  
  
  
