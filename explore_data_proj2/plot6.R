## 1. Import the plotting library
library(ggplot2)

## 2. Read data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 3a. Filter the Baltimore vehicle emissions
bmoreData <- NEI[(NEI$type=="ON-ROAD") & (NEI$fips=="24510"),]
bmoreAggr <- aggregate(Emissions ~ year, data=bmoreData, FUN=sum)

## 3b. Filter the Log Angeles vehicle emissions
losAData <- NEI[(NEI$type=="ON-ROAD") & (NEI$fips=="06037"),]
losAAggr <- aggregate(Emissions ~ year, data=losAData, FUN=sum)

## 4. Groom the data
bmoreAggr$County <- "Baltimore City, MD"
losAAggr$County <- "Los Angeles County, CA"
bothSets <- rbind(bmoreAggr, losAAggr)

## 4. Prepare the output file
png("plot6.png", height=480, width=600)

## 5. Produce the plot
p <- ggplot(bothSets, aes(x=factor(year), y=Emissions, fill=County)) +
    geom_bar(stat="identity") + 
    facet_grid(County ~ ., scales="free") +
    ylab("Annual emissions (Tons)") + 
    xlab("Year") +
    ggtitle("Comparison in Vehicle Emissions across Baltimore and Los Angeles")

## 6. Output the plot
print(p)
dev.off()

