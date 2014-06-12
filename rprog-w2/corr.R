corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    ## declare the placeholder for the new means
    resList <- NULL
    
    ## loop through the id numbers
    for(i in 1:332)
    {
        ## sort out the file name
        fName <- paste(sprintf("%03d", i),".csv", sep="")
        
        ## and the path
        fPath <- paste(directory,"/",fName,sep="")
        
        ## open the relevant file
        thisD <- data.frame(read.csv(fPath))
        
        ## find the complete cases
        complete <- complete.cases(thisD)
        
        ## trim to the complete cases
        thisD <- thisD[complete,]
        
        ## do we have enough?
        if(length(thisD[,1]) > threshold)
        {
            ## get the sulfates
            sulfates <- thisD[,2]
            nitrates <- thisD[,3]
            
            corr <- cor(sulfates, nitrates)
            
            resList <- c(resList, corr)
        }
    }  
    ## collate the answer
    
    ## check the results value
    if(length(resList) > 0)
    {
        return (resList)        
    }
    else
    {
        return (vector(mode="numeric", length=0))
    }
}