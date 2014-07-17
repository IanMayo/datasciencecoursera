gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
countryURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
outGDP <- "gdp.csv"
outCountry <- "country.csv"

## do we need to download gpd?
if(!file.exists(outGDP))
{
    download.file(gdpURL, outGDP, method="curl")
}

## do we need to download countries
if(!file.exists(outCountry))
{
    download.file(countryURL, outCountry, method="curl")
}

## load GDP
gdp <- read.csv(file = outGDP, header = TRUE, skip=4, stringsAsFactors=FALSE,nrows=190)

## trim the DGP data
gdp <- gdp[,c(1, 2 , 4, 5)]
colnames(gdp) <- c("id","Ranking","Name","GDP")

## load countries
countries <- read.csv(file = outCountry, header = TRUE)

## merge the two datasets
merged <- merge(gdp, countries, by.x="id", by.y="CountryCode", all=TRUE)

## find matching entries
matches <- grep("^Fiscal year end: June 30", merged$Special.Notes)

## and output the results
print(length(matches))