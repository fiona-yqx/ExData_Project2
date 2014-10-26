### Plot 5
unique(SCC$SCC.Level.One)
#[1] External Combustion Boilers             Internal Combustion Engines            
#[3] Stationary Source Fuel Combustion       Mobile Sources                         
#[5] Industrial Processes                    Solvent Utilization                    
#[7] Storage and Transport                   Waste Disposal, Treatment, and Recovery
#[9] Natural Sources                         Miscellaneous Area Sources             
#[11] very misc                               LPG Distribution                       
#[13] Petroleum and Solvent Evaporation       Brick Kilns                            
#[15] Waste Disposal                          Domestic Ammonia                       
#[17] MACT Source Categories                 
#17 Levels: Brick Kilns Domestic Ammonia External Combustion Boilers ... Waste Disposal, Treatment, and Recovery

# "Mobile Sources" is the one matches the definition in the source document.

# Get set of SCC for motor vihecle related sources.
motor.scc = SCC$SCC[grepl("Mobile",SCC$SCC.Level.One)]

# Subset and calculate toatl by year.
baltimore.motor = baltimore[baltimore$SCC %in% motor.scc,]
baltimore.motor.emissions = tapply(baltimore.motor$Emissions,baltimore.motor$year,sum)

barplot(baltimore.motor.emissions,
        xlab = "Year", ylab = "Amount of PM2.5 (ton)",
        main = "Motor Vehicle PM2.5 Emissions over Years", col = "dark green", bg = "white")

dev.copy(png, file = "plot5.png")
dev.off()

# There is significant decreas from 1999 to 2002 in the emission of PM2.5 from Motor Vehicles. 
# However over 2002 to 2008, it showed a slight trend of increase.
