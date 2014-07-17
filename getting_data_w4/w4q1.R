fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
outURL <- "community.csv"

## do we need to download it?
if(!file.exists(outURL))
{
    download.file(fileURL, outURL, method="curl")
}

## do we need to load it?
if(!is.null(data))
{
    data <- read.csv(file = outURL, header = TRUE)
}

## split names of any cols containing wgtp
splitNames = strsplit(names(data), "wgtp")

## output the 123rd item
print(splitNames[[123]])