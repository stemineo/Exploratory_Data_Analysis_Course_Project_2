# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_MD_CA_onroad <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD", ]

sub_tot <- aggregate(Emissions ~ year + fips, NEI_MD_CA_onroad, sum)
sub_tot$fips[sub_tot$fips=="24510"] <- "Baltimore, MD"
sub_tot$fips[sub_tot$fips=="06037"] <- "Los Angeles, CA"

png(filename='../plot6.png', width=700, height=550)
g <- ggplot(sub_tot, aes(year, Emissions, color = fips))
g <- g + geom_line() + geom_point() + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle in Baltimore City, MD and Los Angeles, CA')
print(g)
dev.off()

