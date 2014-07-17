## declare the input library
library(quantmod)

## get the amazon quotes
amzn = getSymbols("AMZN",auto.assign=FALSE)

## find the amazon quotes
sampleTimes = index(amzn) 

## how many collected in 2012?
match =sampleTimes[format(sampleTimes, "%Y") == "2012"] 

## output result
print(length(match))

## further trim the list to find mondays
match <- match[weekdays(match)=="Monday"]

## output result
print(length(match))
