# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")
coalSSC  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subNEISCC <- NEISCC[coalSSC, ]
sub_tot <- aggregate(Emissions ~ year, subNEISCC, sum)

png(filename='../plot4.png', width=700, height=550)
g <- ggplot(sub_tot, aes(factor(year), Emissions))
g <- g + geom_line(aes(group=1)) + geom_point()  + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal combustion-related sources, 1999-2008')
print(g)
dev.off()
