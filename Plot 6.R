### Plot 6  
# Get SCC code.
motor.scc = SCC$SCC[grepl("Mobile",SCC$SCC.Level.One)]

# Subset and calculate toatl by year.
la = NEI[NEI$fips == "06037",]
la.motor = la[la$SCC %in% motor.scc,]
la.motor.emissions = tapply(la.motor$Emissions,la.motor$year,sum)

par(mfrow = c(1,2))
barplot(la.motor.emissions,
        xlab = "Year", ylab = "Amount of PM2.5 (ton)",
        main = "Los Angeles County", col = "dark blue", bg = "white",
        width = 430)
barplot(baltimore.motor.emissions,
        xlab = "Year", ylab = "Amount of PM2.5 (ton)",
        main = "Baltimore City", col = "dark green", bg = "white",
        width = 430)

dev.copy(png, file = "plot6.png", width = 860)
dev.off()

# The motor vehicle emissions in Los Angeles County showed a greater change over the years in absolute terms. However, given the much larger volume of PM2.5 emissions in Los Angeles County, the change is much smaller in percentage terms.
# The motor vehicle emission in Baltimore City has a much greater change in percentage terms.


# ---------*(Optional) -----------Confirming conclusion by calculating % change:
la.changes = (la.motor.emissions[-1] - la.motor.emissions[-length(la.motor.emissions)])/ la.motor.emissions[-length(la.motor.emissions)]
baltimore.changes = (baltimore.motor.emissions[-1] - baltimore.motor.emissions[-length(baltimore.motor.emissions)])/ baltimore.motor.emissions[-length(baltimore.motor.emissions)]

la.changes
#        2002        2005        2008 
# -0.21442769  0.01379188  0.02354268

baltimore.changes
#baltimore.motor$year
#2002        2005        2008 
#-0.79030938  0.01048894  0.33591053