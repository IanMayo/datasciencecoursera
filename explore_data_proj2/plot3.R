## 1. Import the plotting library
library(ggplot2)

## 2. Read data file
NEI <- readRDS("summarySCC_PM25.rds")

## 3. Filter the baltimore data
baltiData <- NEI[NEI$fips=="24510",]

## 4. Aggregate the data, ready for plotting
bDataAgg <- aggregate(Emissions ~ year + type,
                                  data = baltiData,
                                  FUN = sum)

## 4. Prepare the output file
png("plot3.png", height=480, width=1024)

## 5. Produce the plot
p <- ggplot(bDataAgg, aes(x = factor(year), y = Emissions, fill = type)) +
    geom_bar(stat="identity") +
    facet_grid(. ~ type) +
    xlab("Year") +
    ylab("Total Annual PM2.5 emissions") +
    ggtitle("PM2.5 emissions for Baltimore")

## 6. Output the plot
print(p)
dev.off()

