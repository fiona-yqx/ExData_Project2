### Plot 4

# *(Optional) Comparing Short.Name and EI.Sector
sub1 = SCC[grepl("Coal",SCC$Short.Name) & grepl("Comb",SCC$Short.Name),]
sub2 = SCC[(grepl("Coal",SCC$Short.Name) & grepl("Comb",SCC$Short.Name)) | 
             (grepl("Coal",SCC$EI.Sector) & grepl("Comb",SCC$EI.Sector)),]
sub3 = SCC[(grepl("Coal",SCC$EI.Sector) & grepl("Comb",SCC$EI.Sector)),]
# Here I tried different subsetting method and compared them. 
# sub1 is the set with short name containing "coal" or "comb".
# sub3 checks EI.Sector instead. sub2 is the union of the two.
# It turns out sub2 is larger than both sets, which mean either sub1 or sub3 is missing a few observations. 
# So I used sub2 and the final method.

# Get the set of SCC code
coal.comb.scc = sub2$SCC
coal.comb = NEI[NEI$SCC %in% coal.comb.scc,]

# Calculate total emissions by year.
coal.emissions = by(coal.comb$Emissions,coal.comb$year,sum)

barplot(coal.emissions,
        xlab = "Year", ylab = "Amount of PM2.5 (ton)",
        main = "Coal Combustion related PM2.5 Emissions over Years")

dev.copy(png, file = "plot4.png")
dev.off()

#Across the United States, coal combustion related PM2.5 emission has DECREASED over 1999 - 2008.