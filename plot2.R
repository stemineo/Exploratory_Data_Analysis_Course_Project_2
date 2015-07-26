# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
# system to make a plot answering this question

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_MD <- subset(NEI, fips=='24510')
sub_tot <- aggregate(Emissions ~ year, NEI_MD, sum)

png(filename='../plot2.png')
barplot(height=sub_tot$Emissions, names.arg=sub_tot$year, xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at Baltimore City, MD, 1999-2008'))
dev.off()
