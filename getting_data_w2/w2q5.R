fourthCol <- function(fileUrl){
    x <- read.fwf(
        file=url(fileUrl),
        skip=4,
        widths=c(1,2,3,4,5,4,4,5,4,4,5,4,4,5,4,4))
  
    tmpCol <- x[,9]
    sum(tmpCol)
#    col4a <- x[,15]
#    col4b <- x[,16]
#    total <- col4a + col4b
#    sum(total)
}