## 1. Import the plotting library
library(ggplot2)

## 2. Read data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 3. Filter the coal data
coalRows <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coalSources <- SCC[coalRows,]
emissions <- NEI[(NEI$SCC %in% coalSources$SCC), ]

## 4. Aggregate the data, ready for plotting
annualEmissions <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

## 4. Prepare the output file
png("plot4.png", height=480, width=600)

## 5. Produce the plot
p <- ggplot(emissions, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("Year") +
    ylab("Total PM2.5 emissions") +
    ggtitle("Coal Combustion-Related Emissions")

## 6. Output the plot
print(p)
dev.off()

