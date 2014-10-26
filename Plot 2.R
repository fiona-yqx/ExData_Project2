### Plot 2
baltimore = NEI[NEI$fips == "24510",]
baltimore.emissions = by(baltimore$Emissions,baltimore$year,sum)
barplot(baltimore.emissions,
        xlab = "Year", ylab = "Amount of PM2.5 (ton)",
        main = "Total PM2.5 Emissions in Baltimore City 1999 - 2008",
        col = "dark blue", bg = "white")
# PM2.5 emission has a slight chance of decreasing in Baltimore City. 
# However the trend is ambiguous given the fluctuation over the 10 years, especitally with the increase in 2005.

dev.copy(png, file = "plot2.png")
dev.off()