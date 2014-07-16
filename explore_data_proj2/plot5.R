## 1. Import the plotting library
library(ggplot2)

## 2. Read data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 3. filter the data
vehicleCategories <- SCC$SCC[grep("Veh",SCC$Short.Name)]  ## find all vehicle related codes
vehicleEmissions <- NEI$SCC %in% vehicleCategories         ## find observations related to these
baltimoreData <- NEI$fips==24510                           ## find baltimore observations

## 4. aggregate the two datasets
sources<-aggregate(NEI$Emissions[vehicleEmissions & baltimoreData] ~ NEI$year[vehicleEmissions & baltimoreData] , NEI, sum)

## 5. annotate the data axes
colnames(sources)<-c("Year","Emissions")

## 6. Prepare the output file
png("plot5.png", height=480, width=600)

## 7. Produce the plot
p <- ggplot(sources, aes(x=factor(Year),y=Emissions)) + geom_bar(stat = "identity") +
    ggtitle("Baltimore City Vehicle Emissions") + labs(x = "Years")

## 8. Output the plot
print(p)
dev.off()
