if (!require("haven")) install.packages("haven") # Installs haven if needed

if (!require("foreign")) install.packages("foreign") # Installs foreign if needed
if (!require("dplyr")) install.packages("dplyr") # Installs dplyr if needed
if (!require("corrr")) install.packages("corrr") # Installs corrr if needed
if (!require("ggplot2")) install.packages("ggplot2") # Installs ggplot2 if needed
if (!require("data.table")) install.packages("data.table") # Installs data.table if needed

install.packages("data.table")
install.packages("tidyverse") 

#library(haven)
library(foreign)
library(dplyr)
library(corrr)
library(ggplot2)
library(data.table)


#load data
datFluData<-read.csv2("C:/local_data/FluData")

datHCT<-read.dta("C:/Users/dil4/OneDrive-Berner Fachhochschule/PhD/07_Data/SHS/SGB2017_CH/SGB2017_CH/A_Daten/SAS/sharew7_rel7-0-0_hc.dta")
datXT<-read.dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_xt.dta")
datPH<-read.dta("C:/Users/joelh/Downloads/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_ph.dta")
C:\Users\dil4\OneDrive - Berner Fachhochschule\PhD\07_Data\SHS\SGB2017_CH\SGB2017_CH\A_Daten\SAS
\\bfh.ch\data\LFE\G\Research-HE\data\SHARE\rel7-0-0\sharew7_rel7-0-0

#only swiss
datHC<-datHC %>% filter(country=="Switzerland")
datXT<-datXT %>% filter(country=="Switzerland")
datPH<-datPH %>% filter(country=="Switzerland")

dat_SHARE_ChinSwee<-merge(datPH, datHC, by="mergeid")

dat_SHARE_ChinSwee<-full_join(datXT,dat_SHARE_ChinSwee,by="mergeid")

dat_SHARE_ChinSwee$status[dat$mergeid=="Cf-042858-01"]



dat_SHARE_ChinSwee$ph089d1==1
summary(dat_SHARE_ChinSwee$ph089d1)
dat_SHARE_ChinSwee$ph089d1!="Selected"

dat_SHARE_ChinSwee$a<-ifelse(dat_SHARE_ChinSwee$ph065_=="No", 1,0)
dat_SHARE_ChinSwee$b<-ifelse(dat_SHARE_ChinSwee$ph095_<5,1,0)
dat_SHARE_ChinSwee$c<-ifelse((dat_SHARE_ChinSwee$ph066_=="Followed a special diet"|dat_SHARE_ChinSwee$ph066_=="Due to illness and followed a special diet"),1,0)
dat_SHARE_ChinSwee$d<-ifelse(dat_SHARE_ChinSwee$ph089d1=="Selected",1,0)
dat_SHARE_ChinSwee$e<-ifelse((dat_SHARE_ChinSwee$ph006d1=="Selected"|dat_SHARE_ChinSwee$ph006d2=="Selected"|dat_SHARE_ChinSwee$ph006d3=="Selected"|dat_SHARE_ChinSwee$ph006d4=="Selected"|dat_SHARE_ChinSwee$ph006d5=="Selected"|dat_SHARE_ChinSwee$ph006d6=="Selected"|dat_SHARE_ChinSwee$ph006d10=="Selected"|dat_SHARE_ChinSwee$ph006d11=="Selected"|dat_SHARE_ChinSwee$ph006d13=="Selected"|dat_SHARE_ChinSwee$ph006d14=="Selected"|dat_SHARE_ChinSwee$ph006d15=="Selected"|dat_SHARE_ChinSwee$ph006d16=="Selected"|dat_SHARE_ChinSwee$ph006d19=="Selected"|dat_SHARE_ChinSwee$ph006d20=="Selected"),1,0)
dat_SHARE_ChinSwee$f<-ifelse(is.na(dat_SHARE_ChinSwee$e),0,1)
dat_SHARE_ChinSwee$g<-ifelse(dat_SHARE_ChinSwee$ph005_=="Not limited",1,0)
dat_SHARE_ChinSwee$h<-ifelse(dat_SHARE_ChinSwee$hc602_>=3,1,0)
dat_SHARE_ChinSwee$i<-ifelse(dat_SHARE_ChinSwee$hc014_>=3,1,0)

dat_SHARE_ChinSwee$j<-ifelse(dat_SHARE_ChinSwee$hc013_>=3,1,0)
dat_SHARE_ChinSwee$k<-ifelse(dat_SHARE_ChinSwee$xt009_>0|is.na(dat_SHARE_ChinSwee$xt009_),1,0)



nrow(filter(dat_SHARE_ChinSwee, is.na(hc013_)))
dat_SHARE_ChinSwee$XT008
XT009_YearDied


levels(dat_SHARE_ChinSwee$ph005_)

summary(dat_SHARE_ChinSwee$ph095_)

levels(dat_SHARE_ChinSwee$ph006d1)
