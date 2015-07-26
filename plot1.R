# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

tot <- aggregate(Emissions ~ year, NEI, sum)

png(filename='../plot1.png')
barplot(height=tot$Emissions, names.arg=tot$year, xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in the US 1999-2008'))
dev.off()
