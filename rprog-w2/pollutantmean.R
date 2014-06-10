pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
  
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
  
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
  
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # declare the placeholder for the new means
    
    ## loop through the id numbers
    for(i in 1:2)
    {
        # sort out the file name
        fName <- paste(sprintf("%03d", i),".csv", sep="")
        
        # and the path
        fPath <- paste(directory,"/",fName,sep="")
        
        # open the relevant file
        thisD <- read.csv(fPath)
        
        # get the relevant pollutant
        thisP <- thisD[pollutant]
        
        # get the mean of this pollutant
        thisM <- colmeans(thisP, na.rm = TRUE)
    }  
}