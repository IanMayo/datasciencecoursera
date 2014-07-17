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

## get the GDP data
gdp <- data[,5]

## drop any commas in the gdp
gdp <- gsub("\\,","", gdp)

## now force it to numeric
gdp <- as.numeric(gdp)

## and calculate the mean
print(mean(gdp))