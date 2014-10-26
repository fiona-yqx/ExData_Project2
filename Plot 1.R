### Plot 1
total.emissions = by(NEI$Emissions,NEI$year,sum)
barplot(total.emissions,
        xlab = "Year", ylab = "Amount of PM2.5 (ton)",
        main = "Total PM2.5 Emissions 1999 - 2008", col = "dark red", bg = "white")
# Total Emissions in US decreased from 1999 to 2008.
dev.copy(png, file = "plot1.png")
dev.off()