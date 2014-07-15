## 1. load the file
NEI <- readRDS("summarySCC_PM25.rds")

## 2. Transform the data
data <- aggregate(Emissions ~ year, NEI, sum)

## 3. Prepare the output file
png('plot1.png')

## 4. Produce the plot
barplot(height=data$Emissions, names.arg=data$year,
        xlab="years", ylab='Annual PM2.5 emissions',
        main='Total PM2.5 emissions')

## 5. Output the plot
dev.off()