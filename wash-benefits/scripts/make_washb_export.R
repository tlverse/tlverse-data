rm(list=ls())



#---------------------------------------
# Load the analysis dataset,
# the baseline covariate dataset
#---------------------------------------

bd <- read.csv("raw_data/washb-bangladesh-enrol-public.csv",colClasses=c("dataid"="character"))
tr <- read.csv("raw_data/washb-bangladesh-blind-tr-public.csv")
bd <- merge(bd,tr, by=c("block","clusterid"),all.x=TRUE, all.y=TRUE)

d <- read.csv("raw_data/washb-bangladesh-anthro-public.csv",colClasses=c("dataid"="character"))
d <- merge(d,tr, by=c("block","clusterid"),all.x=TRUE, all.y=TRUE)

# merge the baseline dataset to the follow-up dataset
ad <- merge(bd,d,by=c("dataid","clusterid","block","tr"),all.x=T,all.y=T)
dim(d)
dim(ad)

#---------------------------------------
# subset to the relevant measurement
# Year 1 or Year 2
#---------------------------------------
table(ad$svy)
ad <- subset(ad,svy==1)
dim(ad)

# subset the anthropometry to target children (excluding siblings)
dim(ad)
ad <- subset(ad,tchild=="Target child")
dim(ad)

# Drop children with extreme whz values
table(ad$whz_x)
ad <- subset(ad,whz_x!=1)


# Exclude children with missing data (none)
table(is.na(ad$whz))

# re-order the tr factor for convenience
ad$tr <- factor(ad$tr,levels=c("Control","Water","Sanitation","Handwashing","WSH","Nutrition","Nutrition + WSH"))

# ensure that month is coded as a factor
ad$month <- factor(ad$month)

# lump field investigators with <100 measurements into a single code (arbitrarily choosing N08002 from the list). This FRA code list with N<100 is the same for years 1 and 2.
ad$fracode[ad$fracode=="20"    ] <- "N08002"
ad$fracode[ad$fracode=="D03538"] <- "N08002"
ad$fracode[ad$fracode=="N00436"] <- "N08002"
ad$fracode[ad$fracode=="N05267"] <- "N08002"
ad$fracode[ad$fracode=="N05268"] <- "N08002"
ad$fracode[ad$fracode=="N05271"] <- "N08002"
ad$fracode[ad$fracode=="N06485"] <- "N08002"
ad$fracode[ad$fracode=="N08000"] <- "N08002"
ad$fracode <- factor(ad$fracode)


# sort the data for perfect replication with jade on the V-fold cross-validation
ad <- ad[order(ad$block,ad$clusterid,ad$dataid,ad$childid),]

#---------------------------------------
# Select covariates with univariate
# associations with the outcome of
# P<0.2 based on a liklihood ratio test
#---------------------------------------


# drop due to so many missing values?
# asset_clock
# birthord

W=c("fracode","month","aged","sex","momage","momedu","momheight","hfiacat","Nlt18","Ncomp","watmin","elec","floor","walls","roof","asset_wardrobe","asset_table","asset_chair","asset_khat","asset_chouki","asset_tv","asset_refrig","asset_bike","asset_moto","asset_sewmach","asset_mobile")
A="tr"
Y="whz"

washb_data <- ad[,c(Y,A,W)]
write.csv(washb_data, "../washb_data.csv",row.names=FALSE)
set.seed(1234)
washb_data_subset <- washb_data[sample(nrow(washb_data), 500),]
write.csv(washb_data_subset, "../washb_data_subset.csv",row.names=FALSE)
