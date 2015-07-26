# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? Which have 
# seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
# system to make a plot answer this question

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_MD <- subset(NEI, fips=='24510')
sub_tot <- aggregate(Emissions ~ year + type, NEI_MD, sum)

png(filename='../plot3.png', width=700, height=550)
g <- ggplot(sub_tot, aes(year, Emissions, color = type))
g <- g + geom_line() + geom_point() + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, MD, 1999-2008')
print(g)
dev.off()
