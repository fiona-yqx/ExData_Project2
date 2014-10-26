### Plot 3
library(reshape)

baltimore.emissions.by.type = melt(tapply(baltimore$Emissions,list(baltimore$year,baltimore$type),sum))
names(baltimore.emissions.by.type) = c("year","type","Emissions")

png("plot3.png")

ggplot(as.data.frame(baltimore.emissions.by.type), aes(y = Emissions, x = year, color = type)) +
  geom_point() +
  geom_line() + ggtitle("Emissions in Baltimore City by Type")

dev.off()

# Non-road, non-point,and on-road emissions have seen DECREASES from 1999 to 2008.
# Point emissions has seen INCREASES from 1999 to 2008