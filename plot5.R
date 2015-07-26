# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City? 

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_MD_onroad <- subset(NEI, fips=='24510' & type == 'ON-ROAD')
sub_tot <- aggregate(Emissions ~ year, NEI_MD_onroad, sum)

png(filename='../plot5.png', width=700, height=550)
g <- ggplot(sub_tot, aes(factor(year), Emissions))
g <- g + geom_line(aes(group=1)) + geom_point() + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle sources in Baltimore City, MD, 1999–2008')
print(g)
dev.off()
