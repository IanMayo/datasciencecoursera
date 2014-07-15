## 1. load the file
NEI <- readRDS("summarySCC_PM25.rds")

## 2. Get the baltimore data
data <- NEI[NEI$fips=="24510",]

## 3. Transform the data
data <- aggregate(Emissions ~ year, data, sum)

## 4. Prepare the output file
png('plot2.png')

## 5. Produce the plot
barplot(height=data$Emissions,
        names.arg=data$year,
        xlab="years", ylab="Annual PM2.5 emissions (Tons)",
        main='Total PM2.5 emissions in Baltimore')

## 6. Output the plot
dev.off()