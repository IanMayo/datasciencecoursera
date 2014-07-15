## 1. Import the plotting library
library(ggplot2)

## 2. Read data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 3. Filter the Baltimore vehicle emissions
bmoreData <- NEI[(NEI$type=="ON-ROAD") & (NEI$fips=="24510"),]
bmoreAggr <- aggregate(Emissions ~ year, data=bmoreData, FUN=sum)

## 4. Prepare the output file
png("plot5.png", height=480, width=600)

## 5. Produce the plot
p <- ggplot(bmoreAggr, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("Year") +
    ylab("Total PM2.5 emissions (Tons)") +
    ggtitle("Baltimore Vehicle Emissions")

## 6. Output the plot
print(p)
dev.off()

