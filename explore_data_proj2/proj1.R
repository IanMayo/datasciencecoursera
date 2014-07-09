## load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## work out the totals, year
totalEmi = aggregate(Emissions ~ year, data=NEI, sum)

## declare the output image
png(filename="plot1.png", width=480, height=480, units="px")

## draw the plot
plot(totalEmi$Emissions, type="b", 
     xaxt="n",  xlab="Year",
##     ylab=expression(PM[2.5]~Emissions~(`in`~tons)), 
     ylab="PM2.5 Emissions (tons))", 
     main=expression(Total~PM[2.5]~Emissions~`in`~United~States))

## stick in the correct labels
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))

## and output the plot
dev.off()