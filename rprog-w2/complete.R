complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
     
    ## declare the placeholder for the new means
    idList <- NULL
    nobsList <- NULL
    
    ## loop through the id numbers
    for(i in id)
    {
        ## sort out the file name
        fName <- paste(sprintf("%03d", i),".csv", sep="")
        
        ## and the path
        fPath <- paste(directory,"/",fName,sep="")
        
        ## open the relevant file
        thisD <- read.csv(fPath)
        
        ## get the list of complete cases        
        valid <- complete.cases(thisD)
        
        ## and trim them
        thisD <- thisD[valid,]
        
        ## how many are there
        numValid = length(thisD[,1])

        ## create the row for this one
        idList <- c(idList, i);
        nobsList <- c(nobsList, numValid)
        
    }  
    ## collate the answer
    res <- data.frame(list(id=idList, nobs=nobsList))
    return (res)
}