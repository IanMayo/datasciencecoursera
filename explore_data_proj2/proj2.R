## load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## filter for the baltimore readings
baltimore = subset(NEI, fips==24510)

## work out the totals for each year
data = aggregate(Emissions ~ year, data=baltimore, sum)

## declare the output image
png(filename="plot2.png", width=480, height=480, units="px")

## draw the plot
plot(data$Emissions, type="l", 
     xaxt="n",  xlab="Year", 
     main="PM2.5 Emissions in Baltimore City",
     ylab="Annual Total PM2.5 Emissions (tons)")

## stick in the correct labels
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))

## and output the plot
dev.off()