fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
outURL <- "gdp.csv"

## do we need to download it?
if(!file.exists(outURL))
{
    download.file(fileURL, outURL, method="curl")
}

## do we need to load it?
if(!is.null(data))
{
    data <- read.csv(file = outURL, header = TRUE, skip=4, stringsAsFactors=FALSE,nrows=190)
}

## find countries that begin with "united"
countryNames = levels(data$X.2)

## output the number that begin with United
print(length(grep("^United", data$X.3)))